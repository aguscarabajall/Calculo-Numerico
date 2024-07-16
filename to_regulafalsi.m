function to_regulafalsi
  a=0;
  b=2;
  it=0;
  itmax=1000;
  estado=0;
  er=0.001;
  while estado==0
    %-----recurrencia--------
    m=(fc(a)-fc(b))/(a-b);
    r=a-(fc(a)/m);
    %------controles detencion------
    it=it+1;
    if itmax<it
      estado=33;
    endif
    if abs(fc(r))<er
      estado=22;
    endif
    %-----actualizacion---------
    if fc(a)*fc(r)<0
      b=r;
    else
      a=r;
    endif
  endwhile
  r
  it
  estado
endfunction
function y=fc(h)
  y=h-2^(-h);
endfunction

