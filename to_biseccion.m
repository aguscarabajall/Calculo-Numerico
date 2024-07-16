function to_biseccion
  %intervalo [0,2];
  a=0;
  b=2;
  it=0;
  itmax=10000;
  estado=0;
  er=0.001;
  while estado==0
 %-----ecuacion de recurrencia----------------
 r=(a+b)/2;
 %-----control de detencion---------
 it=it+1;
  if itmax<it
    estado=33;
  endif
  if abs(fc(r))<er
    estado=22;
  endif
  %-----actualizacion de variables-------
  if fc(a)*fc(r)<0
    b=r;
  else
    a=r;
  endif
endwhile
r
estado
it
endfunction
function y=fc(x)
  y=x-2^(-x);
endfunction

