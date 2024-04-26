function integral_tc_sc
vx=[-2;-1;0;1;2];
vy=[4;1;0;1;4];
dx=vx(2)-vx(1); %paso
I1=ITC(vy,dx)
I2=ISC(vy,dx)
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
function I=ISC(vy,dx)
  n=length(vy);
  w=ones(n,1);
  w(1)=1/3;
  for i=2:2:n-1 %impares
  w(i)=4/3;
  endfor
  for i=3:2:n-2 %pares hablamos de posicion 
  w(i)=2/3;
  endfor
  w(n)=1/3;
  I=0;
  for i=1:n;
   I=I+dx*vy(i)*w(i);
  endfor
endfunction 