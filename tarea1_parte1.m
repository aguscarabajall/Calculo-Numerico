function tarea1_parte1
  #nombres: Joaquin Spongia y Agustina Carabajal
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
