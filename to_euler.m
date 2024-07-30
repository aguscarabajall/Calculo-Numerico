function to_euler
  %euler explicito o adelante
  h=0.1;
  t=0:h:1;
  n=length(t);
  u(1)=4;
  for i=2:n
    %recurrencia
    u(i)=u(i-1)+h*fc(t(i-1),u(i-1));
  endfor
  plot(t,u);
  u(3)
 endfunction
function y=fc(x,s)
   y=1/2*x-1/2*s;
 endfunction
