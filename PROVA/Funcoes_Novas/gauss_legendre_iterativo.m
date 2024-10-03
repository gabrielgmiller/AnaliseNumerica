function [Integral, Delta, Iter, Info] = gauss_legendre_iterativo(a, b, Toler, IterMax, f)
  % Lembrar de adicionar as funcoes dependentes
  % a : limite inferior do intervalo
  % b : limite superior do intervalo
  % Toler : tolerancia
  % IterMax : iteracao maxima
  % f : funcao a integrar
  % Saidas:
  % Integral : valor da integral
  % Delta : menor diferenca relativa obtida
  % Iter : numero de iteracoes
  % Info : informacao sobre convergencia
  % Info = 0: Delta <= Toler
  % Info = 1: Delta > Toler
  Iter = 1;
  n1 = 5;
  n2 = 8;
  [Int, Info] = gauss_legendre(a, b, n2, f);
  % Calculos sucessivos da integral
  while 1
    Iter = Iter + 1;
    n = n1 + n2;
    [Integral, Info] = gauss_legendre(a, b, n, f);
    if Integral ~= 0
      Delta = abs((Integral - Int)/Integral);
    else
      Delta = abs(Integral - Int);
    endif
    if Delta <= Toler || Iter == IterMax
      break;
    endif
    Int = Integral;
    n1 = n2;
    n2 = n;
  endwhile
  % Teste de convergencia
  if Delta <= Toler
    Info = 0;
  else
    Info = 1;
  endif
endfunction
