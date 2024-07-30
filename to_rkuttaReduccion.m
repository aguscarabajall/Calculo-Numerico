function to_rkutta
  h=0.01;
  w=0.5;
  y(:, 1)= [1; 0];
 x=0:h:10;
 n=length(x);
 for i=2:n
   k1=h*fc(x(i-1),y(:, i-1));
   xg=x(i-1)+h/(2*w);
   yg=y(:, i-1)+k1/(2*w);
   k2=h*fc(xg,yg);

   y(:, i)=y(:, i-1)+(1-w)*k1+w*k2;
 endfor
figure(1)
 subplot(2,1,1);
 plot(x,y);
 subplot(2,1,2);
 plot(x, y(1,:));

endfunction
function y=fc(z,x)

  A = [0, 1; -1,-1/4];
  y = A * x;
endfunction
