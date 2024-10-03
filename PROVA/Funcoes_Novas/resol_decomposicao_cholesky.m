function x = resol_decomposicao_cholesky(A,b)
  % Lembrar de usar junto com decomposição_cholesky
  L = decomposicao_cholesky(A)

  % A=LLT
  % LLTx=b
  % Resolver Ly = b
  y = L \ b;

   % Resolver L'x = y
  x = L' \ y;
  endfunction
