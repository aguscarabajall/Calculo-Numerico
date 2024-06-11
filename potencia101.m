function potencia101
#definición de cosas
  tolerancia = 1e-9;
  itmax2 = 100;
  it = 0;
  estado = 0;
#datos del problema
 K=[4/3 -4/3 0 0 0 0
		-3/4 2 -5/4 0 0 0
		0 -5/6 2 -7/6 0 0
    0 0 -7/8 2 -9/8 0
		0 0 0 -9/10 2 -11/10
		0 0 0 0 -11/12 2];
	M=8*eye(6);
	A=inv(M)*K;

#reacomodando la ecuación (K-w^2*M)z=0
#para que se asemeje a la ecuación de autovalores y autovectores
  A = inv(M)*K;
#proponemos un y semilla (columna)
  y = [1;1;1;1;1;1];
#proponemos un r inicial = 0
  r=0;
  while estado == 0
    x = y/norm(y,inf);
    yN = inv(A)*x; #inversa
    alfaN = yN./x;
    %detencion
    rN=dot(yN,x)/dot(x,x);
    error = abs((rN-r)/rN);
    if error < tolerancia
      estado = 22;
    endif
    it = it + 1;
    if it > itmax2
      estado = 33;
    endif
#actualizacion de variables
    y = yN;
    r = rN; #actuallizacion del error
  endwhile
  w = 1/max(alfaN)   #inversa
  #w = max(alfaN)      #normal
  z = yN./norm(yN,inf)     #autovector (norma a infinito cambiar max)
  it
endfunction

