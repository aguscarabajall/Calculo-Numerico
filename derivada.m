function derivada
vx=[-2;-1;0;1;2];
vy=[4;1;0;1;4];
dx=vx(2)-vx(1); %paso
deriv=der(vy,dx)
endfunction
function dy=der(v,paso)
  n=length(v);
  dy(1)=-3/(2*paso)*v(1)+2/paso*v(2)-1/(2*paso)*v(3);
  for i=2:n-1
    dy(i)=(v(i+1)-v(i-1))/(2*paso);
  endfor
dy(n)=3/(2*paso)*v(n)-2/paso*v(n-1)+1/(2*paso)*v(n-2);
endfunction