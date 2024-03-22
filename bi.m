function bi
x1=0;
x2=1;
itmax=1000;
ea=1e-7;
[r,estado]=rbi(x1,x2,itmax,ea)
disp(r)
disp(estado)
endfunction
function [r,estado]=rbi(x1,x2,itmax,ea)
it=0;
estado=0;
while estado==0
  %ecuacion de recurrencia
   r=(x1+x2)/2;
  error=abs(fc(r));
   %control de detencion
  if error<ea
    estado=33;
  endif
it=it+1;
if it>itmax
  estado=22;
endif
%actualizacion de variablesclc
if fc(x1)*fc(r)<0
  x2=r;
else
  x1=r;
endif
endwhile
endfunction
function y=fc(a)
  y=a-cos(a);
  endfunction