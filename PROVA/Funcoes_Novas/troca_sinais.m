function Var = troca_sinais(n1, c)
  % Lembrar de usar com o metodo de fourier
  % n1 : grau do polinomio + 1
  % coeficientes -> c(1)x^n + c(2)c^n-1 + ... + c(n)x + c(n+1)
  % Saida:
  % Numero de variacoes de sinais.
  Var = 0;
  i = 1;
  for j = 2 : n1
    if (c(j) ~= 0)
      if ((c(i)*c(j)) < 0)
        Var = Var + 1;
      endif
      i = j;
    endif
  endfor
endfunction
