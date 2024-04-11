function regula_falsi
  a=0;
  b=1;
  eps=0.01;
  itmax=10;
  it=0;
  estado=0;
  while estado==0
    m=(fc(a)-fc(b))/(a-b);
    rn=a-(fc(a)/m);
    error=abs(fc(rn));
    if error<eps
      estado =22;
    endif
    it=it+1;
    if it>itmax
      estado=33;
    endif
    if fc(a)*fc(b)<0
      b=rn;
    else
      a=rn;
    endif
    it
  endwhile
rn
end
function y=fc(h)
  y=3-7.5*exp(-2*h)+1.5*exp(-3*h);
end



