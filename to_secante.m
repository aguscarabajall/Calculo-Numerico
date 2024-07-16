function to_secante
  x1=1.5;
  x2=2;
  it=0;
  itmax=100;
  estado=0;
  er=0.001;
  while estado==0
    %------recurrencia----------
    m=(f(x1)-f(x2))/(x1-x2);
    rn=x1-(f(x1)/m);
    %-----detencion----------
    it=it+1;
    if itmax<it
      estado=33;
    endif
    if abs(f(rn))<er
      estado=22;
    endif
    %------actualizacion-----
    x1=x2;
    x2=rn;
  endwhile
    it
    estado
    rn
endfunction
function y=f(g)
  y=g-2^(-g);
endfunction

