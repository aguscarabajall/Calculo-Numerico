function metodo_directo
  dt=0.1;
  tf=50;
 vtint= 0 : dt : tf;
for i = 1 : length(vtint)
  g(i)=MD(vtint(i)); #g 1 fila 1501 columnas
endfor
plot(vtint,g);
endfunction
function P = MD(x)
td = 45;
phi=[1,0,0
     1,td/2,(td/2)^2
     1,td,td^2];
y=[0;1;0];
a=inv(phi)*y;
if x <=45/2
P = 1/(td/2)*x;
else
P = -1/(td/2)*x+2;
endif
if x >45
P = 0;
endif
endfunction
