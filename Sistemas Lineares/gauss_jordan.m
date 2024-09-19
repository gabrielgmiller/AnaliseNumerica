function x = gauss_jordan(A, b)
  [n, m] = size(A);
  if m ~= n
    error('A matriz A deve ser quadrada.');
  end

  % Formar a matriz aumentada
  Ab = [A, b];

  for k = 1:n
    % Encontrar o pivô
    [~, idx] = max(abs(Ab(k:n, k)));
    idx = idx + k -1;

    % Trocar linhas
    if idx ~= k
      Ab([k idx], :) = Ab([idx k], :);
    end

    % Normalizar o pivô
    Ab(k, :) = Ab(k, :) / Ab(k,k);

    % Eliminar todos os outros na coluna
    for i = 1:n
      if i ~= k
        Ab(i, :) = Ab(i, :) - Ab(i,k) * Ab(k, :);
      end
    end
  end

  % Solução
  x = Ab(:, end);
end

% Exemplo de uso:
% A = [2, 1, -1; -3, -1, 2; -2, 1, 2];
% b = [8; -11; -3];
% x = gauss_jordan(A, b);
% fprintf('Solução: [%f, %f, %f]\n', x(1), x(2), x(3));

