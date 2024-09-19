function detA = determinante(A)
  [n, m] = size(A);
  if n ~= m
    error('A matriz A deve ser quadrada.');
  end

  detA = 1;
  Ab = A;

  for k = 1:n-1
    % Encontrar o pivô
    [~, idx] = max(abs(Ab(k:n, k)));
    idx = idx + k -1;

    if Ab(idx, k) == 0
      detA = 0;
      return;
    end

    % Trocar linhas
    if idx ~= k
      Ab([k idx], :) = Ab([idx k], :);
      detA = detA * (-1); % Troca de linhas altera o sinal do determinante
    end

    % Eliminar abaixo
    for i = k+1:n
      factor = Ab(i,k) / Ab(k,k);
      Ab(i, k:n) = Ab(i, k:n) - factor * Ab(k, k:n);
    end

    detA = detA * Ab(k,k);
  end

  detA = detA * Ab(n,n);
end

% Exemplo de uso:
% A = [2, 1, -1; -3, -1, 2; -2, 1, 2];
% detA = determinante(A);
% fprintf('Determinante: %f\n', detA);

