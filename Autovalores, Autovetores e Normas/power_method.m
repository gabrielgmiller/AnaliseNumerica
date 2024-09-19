function [lambda, v, iter] = power_method(A, tol, max_iter)
  if nargin < 3
    max_iter = 1000;
  end
  if nargin < 2
    tol = 1e-6;
  end

  n = size(A,1);
  v = ones(n,1);
  v = v / norm(v);
  lambda = 0;

  for iter = 1:max_iter
    w = A * v;
    lambda_new = norm(w);
    v_new = w / lambda_new;

    if abs(lambda_new - lambda) < tol
      lambda = lambda_new;
      v = v_new;
      fprintf('Método da Potência convergiu em %d iterações.\n', iter);
      return;
    end

    lambda = lambda_new;
    v = v_new;
  end

  warning('Método da Potência não convergiu dentro do número máximo de iterações.');
end

% Exemplo de uso:
% A = [2, 1; 1, 3];
% [lambda, v, iter] = power_method(A, 1e-6, 1000);
% fprintf('Autovalor: %f\n', lambda);
% disp('Autovetor:');
% disp(v);

