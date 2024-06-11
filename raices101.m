function raices101
x1=0;
x2=1;
itmax=1000;
ea=1e-7;
it=0;
estado=0;
while estado==0
  %ecuacion de recurrencia
   rn=(x1+x2)/2; %-------------biseccion

   m=(fc(x1)-fc(x2))/(x1-x2); %pendiente regula falsi
   rn=x1-(fc(x1)/m); %---------regula falsi

   m=(fc(x2)-fc(x1))/(x2-x1); %pendiente secante
   rn=x2-(fc(x2)/m);%-------secante

   n=fd(rv) %-------derivada
   rn= rv-(fc(rv)/n); %------newton
  %control de detencion para biseccion regula y secante
  error=abs(fc(rn));
  if error<ea
    estado=33;
  endif
it=it+1;
if it>itmax
  estado=22;
endif

  %actualizacion de variables biseccion
if fc(x1)*fc(rn)<0 %actualizacion de variables falsi (if fc(x1)*fc(x2)<0)
  x2=rn;
else
  x1=rn;
endif
%actualizacion secante
rv=r;
r=rn; % y tmb actualizacion de newton

endwhile
rn
estado
it
endfunction
function y=fc(a)
  %subprograma para la funcion
endfunction
function y=fd(h)
  %subprograma para la derivad (newton)
endfunction
