function [D, V] = qr_eigenvalues(A, tol, max_iter)
  if nargin < 3
    max_iter = 1000;
  end
  if nargin < 2
    tol = 1e-6;
  end

  [n, m] = size(A);
  if n ~= m
    error('A matriz deve ser quadrada.');
  end

  V = eye(n);
  D = A;

  for iter = 1:max_iter
    [Q, R] = qr(D);
    D_new = R * Q;
    V = V * Q;

    if norm(D_new - D, 'fro') < tol
      D = D_new;
      fprintf('Método QR convergiu em %d iterações.\n', iter);
      return;
    end
    D = D_new;
  end

  warning('Método QR não convergiu dentro do número máximo de iterações.');
end

% Exemplo de uso:
% A = [4, 1, 2; 1, 3, 0; 2, 0, 5];
% [D, V] = qr_eigenvalues(A, 1e-6, 1000);
% fprintf('Autovalores:\n');
% disp(diag(D));
% fprintf('Autovetores:\n');
% disp(V);

