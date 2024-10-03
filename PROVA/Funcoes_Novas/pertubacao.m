function p = pertubacao(A, Ae , b)
  % Lembrar de utilizar com norma infinita e numero_de_condicao
  % E lembra que Ae é a matriz com error
  % Tem que ser maior que: norma de Deltax/norma de (x + Deltax)
  k = numero_de_condicao(A);
  n = norma_infinita(A);
  n1 = norma_infinita(A-Ae);
  p = (k * n)/n1;
  endfunction
