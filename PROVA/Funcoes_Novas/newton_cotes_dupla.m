function [Integral, Info] = newton_cotes_dupla(ax, bx, nx, mx, ay, by, ny, my, f)
  % ax : limite inferior em x
  % bx : limite superior em x
  % nx : grau do polinomio em x
  % mx : numero de subintervalos em x
  % ay : limite inferior em y
  % by : limite superior em y
  % ny : grau do polinomio em y
  % my : numero de subintervalos em y
  % f : funcao a ser integrada
  % Saida:
  % Integral: valor da integral
  % Info: Informacao sobre consistencia e convergencia, sendo:
  % Info = 0 -> parametros sao consistente e todos os zeros convergiram
  % Info = 1 -> (n<1 ou n>8)
  % Info = 2 -> se resto(m,n) ~= 0
  % Info = 3 -> se ambas as condicoes ocorreram
  d = [2 6 8 90 288 840 17280 28350];
  c = [1 1 4 1 3 7 32 12 19 75 50 41 216 27 272 751 3577 1323 2989 989 5888 -928 10496 -4540];
  % Consistencia dos parametros
  Info = 0;
  Integral = 0;
  if nx < 1 || nx > 9 || ny < 1 || ny > 8
    Info = Info + 1;
  endif
  if resto(mx, nx) ~= 0 || resto(my, ny) ~= 0
    Info = Info + 2;
  endif
  if Info ~= 0
    return;
  endif
  % Calculo da integral
  px = floor(0.25 * (nx*(nx+2) + resto(nx,2)));
  py = floor(0.25 * (ny*(ny+2) + resto(ny,2)));
  hx = (bx-ax)/mx;
  hy = (by-ay)/my;
  for i = 0 : mx
    x = ax + i*hx;
    jx = px + floor(0.5 * (nx-abs(resto(i,nx) - 0.5*nx)));
    kx = 1 + floor((nx-resto(i,nx))/nx)-floor((mx-resto(i,mx))/mx);
    for j = 0 : my
      y = ay + j*hx;
      jy = py + floor(0.5*ny - abs(resto(j,ny)-0.5*ny));
      ky = 1 + floor((ny - resto(j,ny))/ny) - floor((my-resto(j,my))/my);
      fxy = f(x,y); % Avaliar a funcao integrando em (x,y)
      Integral = Integral + fxy * c(jx) * kx * c(jy) * ky;
    endfor
  endfor
  Integral = nx*ny*hx*hy/(d(nx)*d(ny))*Integral;
endfunction
