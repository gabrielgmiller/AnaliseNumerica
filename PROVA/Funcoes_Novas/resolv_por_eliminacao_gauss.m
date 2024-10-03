function x = resolv_por_eliminacao_gauss(A, b)
  [U,b_new] = eliminacao_gauss_A_b(A, b);
  x = substituicao_retroativa(U, b_new);
  endfunction
