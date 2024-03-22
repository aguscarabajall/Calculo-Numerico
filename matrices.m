function matrices
  M=zeros(3);
  contador=0;
  for i=1:3
    for j=1:3
      contador=contador+1;
      M(i,j)=contador;
    endfor
  endfor
triangularsuperior=trs(M)
diagonal=d(M)
triangularinferior=tri(M)
[maximo,fila,columna]=maxpo(M)
end

  function triangularsuperior=trs(A)
    for i=1:3
      for j=1:3
        if i<=j
          triangularsuperior(i,j)=A(i,j);
        endif
      endfor
    endfor
  endfunction

   function triangularinferior=tri(A)
    for i=1:3
      for j=1:3
        if i>=j
          triangularinferior(i,j)=A(i,j);
        endif
      endfor
    endfor
  endfunction

  function diagonal=d(A)
    for i=1:3
      for j=1:3
        if i=j
          diagonal(i,j)=A(i,j);
        endif
      endfor
    endfor
  endfunction

  function [maximo,fila,columna]=maxpo(A)
    maximo=A(1,1);
    fila=1;
    columna=1;
    for i=1:3
      for j=1:3
        if maximo<A(i,j)
          maximo=A(i,j);
          fila=i;
          columna=j;
        endif
      endfor
    endfor
    endfunction

