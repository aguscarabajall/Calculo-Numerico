%sistema de ecuaciones lineales por Jacobi
function jacobi
n=4;
ea=2e-5;
A=[50,-25,0,0;-25,50,-25,0;0,-25,50,-25;0,0,-25,50];
b=[10;20;20;10];
xv=[1;1;1;1];
estado=0;
it=0;
itmax=1000;
% Ax=b
%Dx+Bx=b
D=diag(diag(A));
B=A-D;
T=-inv(D)*B;
c=inv(D)*b;
while estado==0
x=T*xv+c;
error=max(abs(x-xv));
 if error<ea
    estado=33;
  endif
it=it+1;
if it>itmax
  estado=22;
endif
% actualizacion de variables
xv=x;
endwhile
x
endfunction