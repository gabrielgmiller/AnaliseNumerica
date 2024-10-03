function [U, b_new] = eliminacao_gauss_A_b(A, b)

  aug = [A b];
  n = length(b);

  for i = 1:n-1
    for j = i+1:n
      m = aug(j, i) / aug(i, i);
      aug(j, :) = aug(j, :) - m * aug(i, :);
    endfor
  endfor


  U = aug(:, 1:n);    % Matriz triangular superior U
  b_new = aug(:, end); % Vetor b atualizado
endfunction
