  function x = solucao_sistema_LU (A, b)
  [A, Det, Pivot] = decomposicao_LU (A);
  U = triu(A);
  L = eye(size(A)) + tril(A, -1);
  P = eye(size(A));
  P = P(Pivot,:);
  b = P*b;
  y = subst_sucess(L,b);
  x = subst_retro(U,y');
endfunction
