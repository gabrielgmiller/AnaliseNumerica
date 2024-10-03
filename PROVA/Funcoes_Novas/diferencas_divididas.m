function tabela_dd = diferencas_divididas(x, f)
    % x: vetor com os valores de x
    % f: vetor com os valores de f(x) (correspondente ao polinômio em x usar calcular_polinomio junto)

    n = length(x);                 % número de pontos
    tabela_dd = zeros(n, n);       % matriz para armazenar a tabela de diferenças divididas
    tabela_dd(:, 1) = f(:);        % primeira coluna da tabela recebe os valores de f(x)

    % Preenchendo a tabela de diferenças divididas
    for j = 2:n
        for i = 1:(n - j + 1)
            tabela_dd(i, j) = (tabela_dd(i + 1, j - 1) - tabela_dd(i, j - 1)) / (x(i + j - 1) - x(i));
        endfor
    endfor
endfunction
