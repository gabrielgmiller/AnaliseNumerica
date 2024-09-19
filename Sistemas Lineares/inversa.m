function invA = inversa(A)
  [n, m] = size(A);
  if n ~= m
    error('A matriz A deve ser quadrada.');
  end

  Ab = [A, eye(n)];

  for k = 1:n
    % Encontrar o pivô
    [~, idx] = max(abs(Ab(k:n, k)));
    idx = idx + k -1;

    if Ab(idx, k) == 0
      error('A matriz não é inversível.');
    end

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

  invA = Ab(:, n+1:end);
end

% Exemplo de uso:
% A = [2, 1, -1; -3, -1, 2; -2, 1, 2];
% invA = inversa(A);
% disp('Inversa de A:');
% disp(invA);

