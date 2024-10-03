function [Integral, Info] = gauss_legendre_dupla(ax, bx, nx, ay, by, ny, f)
  % Lembrar de utilizar gauss_legendre_abspe
  % ax : limite inferior em x
  % bx : limite superior em x
  % nx : numero de pontos em x
  % ay : limite inferior em y
  % by : limite superior em y
  % ny : numero de pontos em y
  % f : funcao a ser integrada
  % Saida:
  % Integral : valor da integral
  % Info: Informacao sobre consistencia e convergencia, sendo:
  % Info = 0 -> parametros sao consistente e todos os zeros convergiram
  % Info = -1 -> nx<1 ou ny<1
  % Info = k -> k zeros nao convergiram
  Integral = 0;
  Info = 0;
  % Calculo das abscissas e pesos
  [T, alfa, Info] = gauss_legendre_abspes(nx);
  if Info ~= 0
    return;
  endif
  if ny == nx
    for j = 1 : ny
      beta(j) = alfa(j);
      U(j) = T(j);
    endfor
  else
    [U,beta,Info] = gauss_legendre_abspes(ny);
    if Info ~= 0
      return;
    endif
  endif
  % Calculo da integral dupla
  bax = (bx-ax)/2;
  bay = (by-ay)/2;
  for i = 1 : nx
    x = ax + bax*(T(i)+1);
    Soma = 0;
    for j = 1: ny
      y = ay + bay*(U(j)+1);
      fxy = f(x,y); % Avaliar a funcao integrando em x,y
      Soma = Soma + beta(j)*fxy;
    endfor
    Integral = Integral + alfa(i)*Soma;
  endfor
  Integral = bax*bay*Integral;
endfunction
