function tarea1_parte2
  #nombres: Joaquin Spongia y Agustina Carabajal
  tolerancia = 1e-3;
  itmax = 100;
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
    if it > itmax
      estado = 33;
    endif
    y = yN;
    r = rN;
  endwhile
  w = 1/max(alfaN)
  z = yN./max(yN)
  it
endfunction
