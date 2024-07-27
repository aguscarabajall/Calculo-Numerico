function pruebaact1
 %ejercicio del power 8, ultima diapositiva
 h=0.02;
 x=0:h:6;
 n=length(x);
 w=0.5;
 u0=5;
 du0=2;
 %runge kutta modificado con reduccion
 y(:,1)=[5; 2]; %valores iniciales
 for i=2:n
 k1= h* f(x(i-1), y(:,i-1));
 xg= x(i-1)+ h/(2*w);
 yg= y(:,i-1)+ k1/(2*w);
 k2=h* f(xg,yg);

 y(:,i)= y(:,i-1) +(1-w)*k1+ w*k2; %recurrencia
endfor

  %Metodo diferencia central
  uact=u0;
  uviejo=u0-h*du0 +(h^2)/2 *(-12/5*u0-2/5*du0); %serie de taylor
  it=0;
  for i=0:h:6
    un=(h^3/(5*h+h^2)) *(15*i*sin(3*i)+(-12+ 10/(h^2))*uact-((5/(h^2))-1/h)*uviejo);
    it=it+1;
    vy(it)=uact;
    vx(it)=i;
    %actualizacion
    uviejo=uact;
    uact=un;
  endfor
  figure 1
  subplot(2,2,1)
  plot(vx,vy)
  subplot(2,2,2)
  plot(x,y(1,:))
  subplot(2,2,3)
  plot(y(1,:), y(2,:))
  subplot(2,2,4)
  plot(vy, y(2,:)) %diferencia central en funcion de runge kutta

  %Integral simpson compuesta
  %I de ((A+w(t))*t^2
  %busco los valores de mi x en el que sean igual a 1 e igual a 4
  for i=1:n
    if x(i)==1
      j=i;
    endif
    if x(i)==4
      k=i;
    endif
  endfor
  iter=0
  for i=j:k
    a=(5+vy(i))*x(i)^2;
    iter=iter+1
    va(iter)=a;
  endfor
   I=ISC(va,h)
   t=1:h:4;

   figure 2
   plot(t, va)
endfunction

function y=f(z,x)
  A=[0 , 1; -12/5, -2/5 ];
  b=[0; 15/5];
  y=A*x + (z*sin(3*z))*b;
endfunction
function I=ISC(vector,paso)
  n=length(vector);
  w=ones(1,n);
  w(1)=1/3;
  w(n)=1/3;
  I=0;
  for i=2:2:n-1
    w(i)=4/3;
  endfor
  for i=3:2:n-2
    w(i)=2/3;
  endfor
  for i=1:n
  I=I+ paso*vector(i)*w(i);
  endfor
endfunction


