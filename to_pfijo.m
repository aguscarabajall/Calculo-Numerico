function to_pfijo
  r=2;
  estado=0;
  it=0;
  itmax=1000;
  er=0.01;
  while estado==0
    %--------recurrencia------------
    rn=gc(r);
    %------detencion--------
    if abs(fc(rn))<er
      estado=22;
    endif
    it=it+1;
    if itmax<it
      estado=33;
    endif
    %-------actualizacion---------
    r=rn;
  endwhile
  rn
  it
endfunction
function y=fc(s)
  y=s^2-3;
endfunction
function g=gc(u)
  g=-1/3*u^2+1+u;
endfunction

