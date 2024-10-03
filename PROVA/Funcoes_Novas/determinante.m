function d = determinante(A)
    [m, n] = size(A);

    % Verifica se a matriz é quadrada
    if m ~= n
        error("A matriz precisa ser quadrada");
    endif

    % Caso base: determinante de uma matriz 1x1
    if n == 1
        d = A(1, 1);
        return;
    endif

    % Caso base: determinante de uma matriz 2x2
    if n == 2
        d = A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1);
        return;
    endif

    % Expansão de Laplace para matrizes maiores que 2x2
    d = 0;
    for i = 1:n

        % Submatriz removendo a primeira linha e a i-ésima coluna
        submatriz = A(2:end, [1:i-1, i+1:end]);

        % Expansão de Laplace
        cofactor = (-1)^(1 + i) * A(1, i) * determinante(submatriz);

        % Soma dos co-fatores
        d = d + cofactor;
    endfor
endfunction
