function to_eulermej
  h=0.1;
  t=0:h:1;
  u(1)=4;
  n=length(t);
  for i=2:n
    u(i)=u(i-1)+h*0.5*(fc(t(i-1),u(i-1))+fc(t(i-1)+h,u(i-1)+h*fc(t(i-1),u(i-1))));
  endfor
  u(3)
  plot(t,u,'r')
  endfunction
function y=fc(x,s)
   y=1/2*x-1/2*s;
 endfunction
