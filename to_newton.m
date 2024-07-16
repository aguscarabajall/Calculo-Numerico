function to_newton
  r=2;
  it=0;
  itmax=1000;
  er=0.001;
  estado=0;
  while estado==0
    %-----recurrencia-----
    rn=r-(fc(r)/d(r));
    %-----detencion-----
    it=it+1;
    if itmax<it
      estado=33;
    endif
    if abs(fc(rn))<er
      estado=22;
    endif
    %-----actualizacion------
    r=rn;
  endwhile
  rn
  it
endfunction
function y=fc(h)
  y=h-2^(-h);
endfunction
function g=d(k)
  g=1+(2^(-k)*log(2));
endfunction

