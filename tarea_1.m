 #Nombres: Joaquin Spongia y Agustina Carabajal
function tarea_1
  #Parte 1
  itmax = 1000;
  ea = 1e-7;
  %error relativo (rN-rV)/rN
  x1 = -5;
  x2 = 0;
  x3 = 5;
  [r1,estado] = rbi1(x1, x2, ea, itmax)
  [r2,estado] = rbi2(x2, x3, ea, itmax)
  x = -5 : 2 : 5;
  for i = 1 : length(x)
    y(i) = fc(x(i));
  endfor
  plot(x,y,'b')
  hold on
  plot(r1,0,'*r')
  hold on
  plot(r2,0,'*r')
  hold off

  #Parte 2
  tolerancia = 1e-3;
  itmax2 = 100;
  it = 0;
  estado = 0;
  L = 100;
  T = 10000;
  m = 0.8;
  dr = L/6;
  M = m*eye(5);
  J = [4/3,-4/3,0,0,0
      -3/4,2,-5/4,0,0
      0,-5/6,2,-7/6,0
      0,0,-7/8,2,-9/8
      0,0,0,-1.1583,2.1583];
  K =(T/dr^2)*J;
  #reacomodando la ecuación (K-w^2*M)z=0
  #para que se asemeje a la ecuación de autovalores y autovectores
  A = inv(M)*K;
  #proponemos un y semilla
  y = [1;1;1;1;1];
  #proponemos un r inicial = 0
  r = 0;
  while estado == 0
    x = y/norm(y,inf);
    yN = inv(A)*x;
    alfaN = yN./x;
    rN=dot(yN,x)/dot(x,x);
    error = abs(rN-r);
    if error < tolerancia
      estado = 22;
    endif
    it = it + 1;
    if it > itmax2
      estado = 33;
    endif
    y = yN;
    r = rN;
  endwhile
  w = 1/max(alfaN)
  z = yN./max(yN)
  it
endfunction
function [r1,estado] = rbi1(x1, x2, ea, itmax)
  it = 0;
  estado = 0;
  while estado == 0
    r1 = (x1 + x2)/2;
    error = abs(fc(r1));
    if error < ea
      estado = 21;
    endif
    it = it + 1;
    if it > itmax
      estado = 31;
    endif
    if fc(x1)*fc(r1)<0
      x2 = r1;
    else
      x1 = r1;
    endif
  endwhile
endfunction
function [r2,estado] = rbi2(x2, x3, ea, itmax)
  it = 0;
  estado = 0;
  while estado == 0
    r2 = (x2 + x3)/2 ;
    error = abs(fc(r2));
    if error < ea
      estado =22;
    endif
    it = it + 1;
    if it > itmax
      estado = 32;
    endif
    if fc(r2)*fc(x3)<0
      x2 = r2;
    else
      x3 = r2;
    endif
  endwhile
endfunction
function y=fc(s)
  y=s^2-s-2.5;
  endfunction

