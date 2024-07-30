function RungeKutta
  h = 0.25;
  x = 0:h:0.5;
  w = 0.5;
  y(1,1) = 0;
  y(2,1) = 2;
  n = length(x);
  for j = 1 : n
    ye(j) = fex(x(j));
  endfor

  for i = 2: n
    k1 = h * func(y(:, i-1));
    xg = x(i-1) + h/(2*w);
    yg = y(:, i-1) + k1/(2*w);
    k2 = h * func(yg);
    y(:,i) = y(:, i-1) + (1-w) * k1 + w * k2;
  endfor

  plot(x, y(1,:), 'r')
  y
endfunction

function func = func(y)
  A = [0, 1;-9.8, 0];
  func = A * y;
endfunction

function fex = fex(x)
  fex = 6 * exp(-x/2) -2 + x;
endfunction
