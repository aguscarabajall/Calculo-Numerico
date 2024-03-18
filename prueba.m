clc
clear
w=[0.2,0.4,10,15];
c=[15,15,-5,5];
t = 0 : 0.1 : 10

for i = 1 : (length(t))
  it = t(i);
  suma = 0;
  for j=1:4
   suma = suma + c(j)*sin(w(j)*it);
  endfor
  g(i) = suma;
end

plot(t,g,'r')
