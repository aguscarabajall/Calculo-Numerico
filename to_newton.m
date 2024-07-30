function to_newton
  r=0.00;
  it=0;
  itmax=10;
  er=1e-4;
  estado=0;
  tol=0.0217
  while estado==0
    %-----recurrencia-----

    rn=r-(fc(r)/d(r));
    draiz=rn-r;
    Cr=(rn-r)/rn
    %-----detencion-----
    it=it+1;
    if itmax<it
      estado=33;
    endif
    if Cr<tol
      estado=44;
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
  y=3-7.5*exp(-2*h)+1.5*exp(-3*h);
endfunction
function g=d(k)
  g=15*exp(-2*k)-4.5*exp(-3*k);
endfunction

