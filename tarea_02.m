function tarea_02
  x1 = 0:0.1:5;
   for i = 1 : length(x1)
    y1(i)=MN(x1(i));
  endfor
  x2=0:0.1:6 ;
  for i = 1 : length(x2)
    y2(i)=ML(x2(i));
  endfor
  x3 = 0:0.1:10 ;
  for i = 1 : length(x3)
    y3(i)=MD(x3(i));
  endfor
  x12=0:0.1:10;
  for i=1:length(x12)
    y12(i)=MN(x12(i));
  endfor
  dt=0.1;
  dy=der(y12,dt);
figure(1)
subplot(2,2,1)  
  plot(x1,y1,'r')
subplot(2,2,2)
  plot(x2,y2,'g')
subplot(2,2,3)  
  plot(x3,y3,'b')
subplot(2,2,4)
  plot(x12,dy,'k')
%Integral con metodo trapecio compuesto
vxt=0:0.1:5;
for i = 1 : length(vxt)
    vyt(i)=ML(vxt(i));
  endfor
  It=ITC(vyt,0.1)
%Integral con metodo simpson compuesto
  vxs=0.5:0.1:1;
  for i=1:length(vxs)
    vys(i)=MD(vxs(i));
  endfor
Is=ISC(vys,0.1)
%Parte 3
vy3=[-1;-2;3;4;6;4];
  phi = [0 , 0 , 1
         1 , 1 , e
         2 , 4 ,exp(2)
         3 , 9 ,exp(3)
         4, 16 ,exp(4)
         5, 25 ,exp(5)];
  M = transpose(phi)*phi;
  A = transpose(phi)*vy3;
  a = inv(M)*A;
xMC = 0:0.05:5 ;
  for i =1 : length(xMC)
    yMC(i)=MC(xMC(i),a);
  endfor
%integral area metodo trapecio compuesto
Area=ITC(yMC,0.05)
r=ra(yMC)
figure(2)
plot(xMC,yMC)
endfunction
function P1=MN(h)
  P1=2*h-4*h*(h-0.5)+(8/19)*h*(h-0.5)*(h-1);
endfunction
function P2=ML(x)
  if x > 1
    P2 = 0;
  else
    P2=1*(x/0.5)*((x-1)/(0.5-1))*((x-10)/(0.5-10));
  endif
  endfunction
function P3=MD(x)
  if x <0.5
    P3=2*x;
   else
    P3=-2*x+2;
  endif
  if x>1
    P3=0;
  endif
endfunction
function Pn=MC(x,a)
  Pn = a(1)*x+a(2)*x^2+a(3)*exp(x);
endfunction
function dy=der(v,paso)
  n=length(v);
  dy(1)=-3/(2*paso)*v(1)+2/paso*v(2)-1/(2*paso)*v(3);
  for i=2:n-1
    dy(i)=(v(i+1)-v(i-1))/(2*paso);
  endfor
dy(n)=3/(2*paso)*v(n)-2/paso*v(n-1)+1/(2*paso)*v(n-2);
endfunction
function I=ITC(vy,paso)
  n=length(vy);
  w=ones(n,1);
  w(1)=0.5;
  w(n)=0.5;
  I=0;
  for i=1:n;
    I=I+paso*vy(i)*w(i);
  endfor
endfunction
function I=ISC(vector,paso)
  n=length(vector);
  w=ones(n,1);
  w(1)=1/3;
  for i=2:2:n-1 %impares
  w(i)=4/3;
  endfor
  for i=3:2:n-2 %pares hablamos de posicion 
  w(i)=2/3;
  endfor
  w(n)=1/3;
  I=0;
  for i=1:n;
   I=I+paso*vector(i)*w(i);
  endfor
endfunction 
