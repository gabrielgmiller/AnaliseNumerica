function [U] = eliminacao_gauss_M_only(A)

  aug = A;
  n = size(A,1);

  for i = 1:n-1
    for j = i+1:n
      m = aug(j, i) / aug(i, i);
      aug(j, :) = aug(j, :) - m * aug(i, :);
    endfor
  endfor
  U = aug

