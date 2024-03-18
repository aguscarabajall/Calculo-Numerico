function vectores
  x= [0,2,34,65,78,9]
  [maximo,posicion]=maxpo(x)
  [minimo,posicion]=minpo(x)
  [normacuadratica]=normacua(x)
end
function [maximo,posicion]=maxpo(m)
  maximo=m(1);
  posicion=1;
  for i=1:(length(m))
    if maximo<m(i)
      maximo=m(i);
      posicion=i;
    endif
  endfor
end
function [minimo,posicion]=minpo(m)
      posicion=i;
  minimo=m(1);
  posicion=1;
  for i=1:(length(m))
    if minimo> m(i)
      minimo=m(i);
    endif
  endfor
end

function [normacuadratica]=normacua(m)
  normacua=0;
  suma=0;
  for i=1:(length(m))
    suma=suma+pow2(m(i));
  endfor
normacuadratica=sqrt(suma);
end
