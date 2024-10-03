function d = extrai_diagonal(A)
    % Inicializa um vetor para armazenar a diagonal
    [n, m] = size(A);  % Obtém o tamanho da matriz
    d = zeros(min(n, m), 1);  % Cria um vetor de tamanho adequado

    % Loop para extrair a diagonal
    for i = 1:min(n, m)
        d(i) = A(i, i);
    end
end
