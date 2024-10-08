function [s2, Info] = splines_extrapolados(n, x, y)
  % Utilizar com splines_avaliar que é o principal
  % Entrada:
  % n: numero de pontos
  % x: vetor de abscissas em ordem crescente
  % y: vetor de ordenadas
  % Saida:
  % s2: derivadas segundas
  % Info: informacoes sobre erro:
  %        Info = 0: nao houve erro
  %        Info = -1: numero de pontos n<4
  %        Info = -2: abscissas nao estao em ordem crescente
  if n < 4
    Info = -1;
    return;
  endif
  Ordenado = true;
  for i = 2 : n
    Ordenado = Ordenado & (x(i-1)<x(i));
  endfor
  if ~Ordenado
    Info = -2;
    return;
  endif
  Info = 0;
  m = n-2;
  % construcao so distema linear tridiagonal nao simetrico
  Ha = x(2)-x(1);
  Deltaa=(y(2)-y(1))/Ha;
  Hb=x(3)-x(2);
  Deltab=(y(3)-y(2))/Hb;
  d(1)=(Ha+Hb)*(Ha+2*Hb)/Hb;
  c(2)=Hb-(Ha^2)/Hb;
  s2(2)=6*(Deltab-Deltaa);
  for i = 2:m-1
    ip1=i+1;
    ip2=i+2;
    Ha=Hb;
    Deltaa=Deltab;
    Hb=x(ip2)-x(ip1);
    Deltab=(y(ip2)-y(ip1))/Hb;
    d(i)=2*(Ha+Hb);
    e(i-1)=Ha;
    c(ip1)=Hb;
    s2(ip1)=6*(Deltab-Deltaa);
  endfor
  Ha=Hb;
  Deltaa=Deltab;
  Hb=x(n)-x(n-1);
  Deltab=(y(n)-y(n-1))/Hb;
  d(m)=(Ha+Hb)*(Hb+2*Ha)/Ha;
  e(m-1)=Ha-(Hb^2)/Ha;
  s2(m+1)=6*(Deltab-Deltaa);
  % Eliminacao de Gauss
  for i = 2:m
    ip1=i+1;
    im1=i-1;
    t=e(im1)/d(im1);
    d(i)=d(i)-t*c(i);
    s2(ip1)=s2(ip1)-t*s2(i);
  endfor
  % Solucao por substituicoes retroativas
  s2(m+1)=s2(m+1)/d(m);
  for i=m:-1:2
    s2(i)=(s2(i)-c(i)*s2(i+1))/d(i-1);
  endfor
  Ha=x(2)-x(1);
  Hb=x(3)-x(2);
  s2(1)=((Ha+Hb)*s2(2)-Ha*s2(3))/Hb;
  Ha=x(n-1)-x(n-2);
  Hb=x(n)-x(n-1);
  s2(n)=((Ha+Hb)*s2(n-1)-Hb*s2(n-2))/Ha;
endfunction
