%f(x)=x-cos(x) por secante
function se_1
rv=0;
r=0.1;
itmax=1000;
ea=1e-7;
it=0;
estado=0;
while estado==0
  %ecuacion de recurrencia
   rn=r-(fc(r))/((fc(r)-fc(rv))/(r-rv));
  error=abs(fc(rn));
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
disp(rn)
disp(estado)
disp(it)
disp(error)
endfunction
function y=fc(a)
  y=a-cos(a);
  endfunction