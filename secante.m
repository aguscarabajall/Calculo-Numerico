function secante
  rv=0;
  r=0.1;
  eps=1e-4;
  itmax=14;
  it=0;
  estado=0;
  while estado==0
    m=(fc(r)-fc(rv))/(r-rv);
    rn=r-(fc(r)/m);
    error=abs(fc(rn));
    if error<eps
      estado =22;
    endif
    it=it+1;
    if it>itmax
      estado=33;
    endif
      rv=r;
      r=rn;
    it
  endwhile
end
function y=fc(h)
  y=3-7.5*exp(-2*h)+1.5*exp(-3*h);
end
