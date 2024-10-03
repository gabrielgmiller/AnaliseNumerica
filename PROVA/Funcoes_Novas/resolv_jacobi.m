function [x, iter] = resolv_jacobi(A, b, tol, max_iter)
  % Lembrar de usar o pivotar matriz antes só para ganrantir que seja estritamente dominante
  % E multiplicar b com P para ter o vetor novo
  % E lembrar de ver se Rho < 1 co raio_espectral_rho

  n = length(b);
  x = zeros(n, 1);

  for iter = 1:max_iter
    x_old = x;


    for i = 1:n
      sum1 = A(i, :) * x_old - A(i, i) * x_old(i);
      x(i) = (b(i) - sum1) / A(i, i);
    endfor


    if norm(x - x_old, inf) < tol
      break;
    endif
  endfor

  if iter == max_iter
    disp('Aviso: O método não convergiu dentro do número máximo de iterações.');
  endif
endfunction
