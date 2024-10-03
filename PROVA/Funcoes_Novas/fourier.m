function NumMax = fourier(n, c, a, b)
  % n : grau, coeficientes do polinomio e limites do intervalo, sendo c tal que
  % c : coeficientes do polinomio
  % a e b : limites do intervalo
  % Saida:
  % NumMax : numero maximo de raizes reais no intervalo
  n1 = n + 1;
  n2 = n + 2;
  for i = 1 : n
    DerPol(i) = c(i);
  endfor
  % avaliar polinomio em a e b
  DerPol_a(1) = horner(n,c,a);
  DerPol_b(1) = horner(n,c,b);
  % calculo das derivadas e seus valores em a e b
  for i = 1 : n
    for j = 1 : n1-i
      DerPol(j) = DerPol(j)*(n2-i-j);
    endfor
    DerPol_a(i+1) = horner(n-i, DerPol, a);
    DerPol_b(i+1) = horner(n-i, DerPol, b);
  endfor
  % variacoes de sinais dos coeficientes do polinomio e suas derivadas em a e b
  VarSinal_a = troca_sinais(n1, DerPol_a);
  VarSinal_b = troca_sinais(n1, DerPol_b);
  NumMax = VarSinal_a - VarSinal_b;
endfunction
