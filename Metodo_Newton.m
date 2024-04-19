function Metodo_Newton
  x=0:0.1:5;
  for i=1:length(x);
    y(i)=MN(x(i));
  endfor
plot(x,y)
endfunction
function P=MN(h)
  P=2*h-4*h*(h-0.5)+(8/19)*h*(h-0.5)*(h-1);
endfunction
