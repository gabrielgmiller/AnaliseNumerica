function [A, P] = pivotar_matriz(A)
    % A é a matriz de entrada
    % P será a matriz de permutação usada na pivotação

    n = size(A, 1); % Tamanho da matriz (assumimos que A é quadrada)
    P = eye(n);     % Inicializa a matriz de permutação como a identidade

    for k = 1:n-1
        % Encontra o índice da linha com o maior valor absoluto na coluna k
        [~, maxIndex] = max(abs(A(k:n, k)));
        maxIndex = maxIndex + k - 1;  % Ajusta o índice relativo à matriz inteira

        % Se o maior valor não estiver na linha atual, faz a troca de linhas
        if maxIndex ~= k
            % Troca de linhas em A
            A([k, maxIndex], :) = A([maxIndex, k], :);

            % Atualiza a matriz de permutação
            P([k, maxIndex], :) = P([maxIndex, k], :);
        endif
    endfor
endfunction
