function [U, S, V] = svd_decomposition(A)
  [U, S, V] = svd(A);
end

% Exemplo de uso:
% A = [1, 2; 3, 4];
% [U, S, V] = svd_decomposition(A);
% fprintf('Matriz U:\n');
% disp(U);
% fprintf('Matriz S:\n');
% disp(S);
% fprintf('Matriz V:\n');
% disp(V);

