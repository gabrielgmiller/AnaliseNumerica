function [D, V] = jacobi_AA(A, tol, max_iter)
  % V : autovalores
  % D : autovetores
  if nargin < 3
    max_iter = 100;
  endif
  if nargin < 2
    tol = 1e-6;
  endif

  [n, m] = size(A);
  if n ~= m
    error('A matriz deve ser quadrada.');
  endif

  V = eye(n);
  D = A;

  for iter = 1:max_iter
    % Encontrar o elemento não diagonal de maior magnitude
    off_diag = D - diag(diag(D));
    [~, idx] = max(abs(off_diag(:)));
    [p, q] = ind2sub(size(D), idx);

    if abs(D(p,q)) < tol
      break;
    endif

    % Calcular o ângulo de rotação
    if D(p,p) == D(q,q)
      theta = pi/4;
    else
      theta = 0.5 * atan(2 * D(p,q) / (D(p,p) - D(q,q)));
    endif

    c = cos(theta);
    s = sin(theta);

    % Rotação de Jacobi
    J = eye(n);
    J([p q], [p q]) = [c -s; s c];

    D = J' * D * J;
    V = V * J;
  endfor

  if iter == max_iter
    warning('Método de Jacobi não convergiu dentro do número máximo de iterações.');
  else
    fprintf('Método de Jacobi convergiu em %d iterações.\n', iter);
  endif
endfunction

