%f(x)=x-cos(x) por secante
function ejercicio2_2023
rv=0.0000;
r=0.2000;
itmax=3;
ea=1e-7;
it=0;
estado=0;
while estado==0
  %ecuacion de recurrencia
   rn=r-(fc(r))/((fc(r)-fc(rv))/(r-rv))
  error=abs(fc(rn));
  y=fc(rn)
   %control de detencion
  if error<ea
    estado=33;
  endif
it=it+1;
if it>itmax
  estado=22;
endif
%actualizacion de variables
rv=r;
r=rn;
endwhile
endfunction
function y=fc(a)
  y=3.2000+(-6.4000)*exp(-0.5000*a);
endfunction
