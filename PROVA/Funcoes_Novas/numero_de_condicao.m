function k = numero_de_condicao(A)
  % Lembrar de utilizar com norma infinita
  A1 = norma_infinita(A);
  A_inv = inv(A);
  A2 = norma_infinita(A_inv);
  k = A1 * A2;
  endfunction
