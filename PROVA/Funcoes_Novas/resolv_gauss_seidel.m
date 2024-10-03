function [x, iter] = resolv_gauss_seidel(A, b, tol, max_iter)
  % Lembrar de tambem verificar se Rho é < 1 com a função raio_espectral_rho
  % E pivotar a matriz tbm só para garanteir e multiplicar o b com P
  n = length(b);
  x = zeros(n, 1);

  for iter = 1:max_iter
    x_old = x;

    for i = 1:n
      sum1 = A(i, 1:i-1) * x(1:i-1);
      sum2 = A(i, i+1:n) * x_old(i+1:n);


      x(i) = (b(i) - sum1 - sum2) / A(i, i);
    endfor


    if norm(x - x_old, inf) < tol
      break;
    endif
  endfor


  if iter == max_iter
    disp('Aviso: O método não convergiu dentro do número máximo de iterações.');
  endif
endfunction
