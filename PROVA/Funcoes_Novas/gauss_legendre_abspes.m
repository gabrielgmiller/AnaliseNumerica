function [T, W, Info] = gauss_legendre_abspes(n)
  % n : numero de pontos
  % Saida:
  % T : abscissas (T(1): menor zero, e T(n): maior zero)
  % W : pesos
  % Info:
  % Info = 0: n >= 1 e todos os zeros convergiram,
  % Info = k: k zeros nao convergiram
  T = [];
  W = [];
  if n < 1
    Info = -1;
    return;
  endif
  Toler = 10^(-15);
  IterMax = 30; % toleracncia e numero maximo de iteracoes;
  Info = 0;
  m = floor(n/2);
  pi8 = 3.141592653589793;
  % Os zeros sao simetricos, calculam-se apenas os positivos
  for i = 1 : m
    % Valor inicial
    z = cos((i-0.25)/(n+0.5)*pi8);
    % Calculo do i-esimo zero do polinomio de Legendre via Newton-Raphson
    delta = 1 + Toler;
    Iter = 0;
    while 1
      % Avaliacao do polinomio de Legendre e sua derivada no ponto z
      p1 = 1;
      Pz = z;
      for k = 2 : n
        p0 = p1;
        p1 = Pz;
        Pz = ((2*k - 1)*z*p1 - (k-1)*p0)/k;
      endfor
      DPz = n*(p1-z*Pz)/(1-z^2);
      if abs(delta) <= Toler || IterMax == Iter
        break;
      endif
      delta = Pz/DPz;
      z = z-delta;
      Iter = Iter + 1;
    endwhile
    % Verificacao da convergencia do i-esimo zero
    if abs(delta) <= Toler
      T(i) = -z;
      T(n+1-i) = z; # Abscissas
      W(i) = 2/((1-z^2)*DPz^2);
      W(n+1-i) = W(i); # pesos
    else
      T(i) = 0;
      T(n+1-i) = 0;
      W(i) = 0;
      W(n+1-i) = 0;
      Info = Info + 1;
    endif
  endfor
  % O zero central do polinomio de Legendre de grau impar e nulo
  if resto(n,2) ~= 0
    T(m+1) = 0;
    W(m+1) = pi8/2 * exp(lgamma((n+1)/2) - lgamma(n/2 + 1))^2; % Calculo do logaritmo
  endif
endfunction
