function [L, U] = eliminacao_gauss_com_pivotacaoLU(A)
  n = size(A, 1);
  L = eye(n);  % Inicializa a matriz L como a identidade
  U = A;       % Copia A para iniciar o processo de eliminação

  for k = 1:n-1
    % Encontra o pivô (maior elemento em valor absoluto na coluna k)
    [~, pivot] = max(abs(U(k:n, k)));
    pivot = pivot + k - 1;

    % Troca as linhas, se necessário
    if pivot ~= k
      U([k, pivot], :) = U([pivot, k], :);
      L([k, pivot], 1:k-1) = L([pivot, k], 1:k-1);  % Troca as linhas em L
    end

    % Eliminação Gaussiana
    for i = k+1:n
      L(i, k) = U(i, k) / U(k, k);
      U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n);
    endfor
  endfor
endfunction
