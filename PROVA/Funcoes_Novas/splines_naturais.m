function [s2, Info] = splines_naturais(n, x, y)
   % Utilizar com splines_avaliar que é o principal
   % Entradas:
   % numero de pontos, vetor de abscissas em ordem crescente e vetor de ordenadas
   % Saidas:
   % derivadas segundas e informacao sobre erro, sendo
   % Info = 0: nao houve erro, Info = -1: numero de pontos n < 3 e
   % Info = -2: abscissas nao estao em ordem crescente.
  if n < 3
    Info = -1;
    return;
  endif
  Ordenado = true;
  for i = 2 : n
    Ordenado = Ordenado & x(i-1)<x(i);
  endfor
  if ~Ordenado
    Info = -2;
    return;
  endif
  Info = 0;
  m = n-2;
  % Construcao do sistema linear tridiagonal simetrico
  Ha = x(2)-x(1);
  Deltaa = (y(2)-y(1))/Ha;
  for i = 1:m
    ip1 = i+1;
    ip2 = i+2;
    Hb = x(ip2) - x(ip1);
    Deltab = (y(ip2)-y(ip1))/Hb;
    e(i) = Hb;
    d(i) = 2*(Ha+Hb);
    s2(ip1) = 6*(Deltab-Deltaa);
    Ha = Hb;
    Deltaa = Deltab;
  endfor
  % Eliminacao de Gauss
  for i = 2:m
    ip1 = i + 1;
    im1 = i -1;
    t = e(im1)/d(im1);
    d(i) = d(i)-t*e(im1);
    s2(ip1) = s2(ip1)-t*s2(i);
  endfor
  % Solucao por substituicoes retroativas
  s2(m+1) = s2(m+1)/d(m);
  for i = m : -1 : 2
    ip1 = i + 1;
    im1 = i - 1;
    s2(i) = (s2(i)-e(im1)*s2(ip1))/d(im1);
  endfor
  s2(1) = 0;
  s2(n) = 0;
endfunction
