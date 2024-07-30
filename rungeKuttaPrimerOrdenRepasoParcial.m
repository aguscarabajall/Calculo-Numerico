function rungeKuttaRepaso

  h = 1/100;
  x = 1.6:h:1.9;
  y(1) = 7.3;
  w = 1/2;
  for i = 2: length(x)
    k1 = h * f(x(i-1), y(i-1));
    xG = x(i-1) + h / (2 * w);
    yG = y(i-1) + k1 / (2 * w);
    k2 = h * f(xG, yG);
    y(i) = y(i-1) + (1 - w) * k1 + w * k2
  endfor
 y(2)
endfunction
function  y=f(t,s)
  y=2*s-2*t-1;
  endfunction
