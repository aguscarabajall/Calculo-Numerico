function gauss_seidel
  er=0.01;
  it=0;
  itmax=100;
  A = [50, -25, 0, 0
      -25, 50, -25, 0
       0, -25, 50, -25
       0, 0, -25, 50];
  b = [10; 20; 20; 10];
  xv=[0; 0; 0; 0];
  D=diag(diag(A));
  U=[0, 25, 0, 0
     0, 0, 25, 0
     0, 0, 0, 25
     0, 0, 0, 0];
 L=(D-A-U)
 %recurrencia
 T=inv(D-L)*U;
 c=inv(D-L)*b;
 estado=0;
 while estado==0
   x=T*xv+c;
   if max(abs(x-xv))<er
     estado=33;
   endif
   it=it+1;
   if itmax<it
     estado=22;
   endif
   %actualizacion
   xv=x;
 endwhile
 x
 A * x

