function integral_tc
vx=[-2;-1;0;1;2];
vy=[4;1;0;1;4];
dx=vx(2)-vx(1); %paso
I=ITC(vy,dx)
endfunction
function I=ITC(vy,dx)
  n=length(vy);
  w=ones(n,1);
  w(1)=0.5;
  w(n)=0.5;
  I=0;
  for i=1:n;
    I=I+dx*vy(i)*w(i);
  endfor
endfunction