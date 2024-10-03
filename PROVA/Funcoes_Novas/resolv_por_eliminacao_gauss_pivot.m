function x = resolv_por_eliminacao_gauss_pivot(A, b)
  % Pivota a matriz A e arruma b
  [A,P] = pivotar_matriz(A);
  b = P * b;

  [U,b_new] = eliminacao_gauss_A_b(A, b);
  x = substituicao_retroativa(U, b_new);
  endfunction
