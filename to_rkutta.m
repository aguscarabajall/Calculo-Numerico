function to_rkutta
  h=0.08;
  w=0.5;
  y(1)=1;
 x=0:h:0.16;
 n=length(x);
 for i=2:n
   k1=h*fc(x(i-1),y(i-1));
   xg=x(i-1)+h/(2*w);
   yg=y(i-1)+k1/(2*w);
   k2=h*fc(xg,yg);

   y(i)=y(i-1)+(1-w)*k1+w*k2;
 endfor
 y(3)
 x(3)
 plot(x,y)
endfunction
function y=fc(x,s)
  y=2*x*s^2;
  endfunction
