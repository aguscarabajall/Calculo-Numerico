function funcion_por_partes
  xi=-1;
  xf=3;
  n=101;
  dx=(xf-xi)/(n-1);
  x=xi:dx:xf;
  for i=1:length(x)
    y(i)=gg(x(i));
  endfor
  plot(x,y,'b');
end
function p=gg(m)
  if m<0
    p=0;
  else
    p=m;
  endif
  if m>1
    p=2-m;
  endif
  if m>2
    p=0;
  endif
end
