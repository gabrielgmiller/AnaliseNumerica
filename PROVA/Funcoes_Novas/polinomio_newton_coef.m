function coeficientes = polinomio_newton_coef(x, y)
    % x: vetor com os valores de x
    % y: vetor com os valores de y
    % Retorna os coeficientes do polinômio de Newton na forma expandida para qualquer polinomio

    % Calcula a tabela de diferenças divididas
    tabela_dd = diferencas_divididas(x, y);

    % O vetor de diferenças divididas (primeira linha da tabela)
    coef = tabela_dd(1, :);

    % Inicializa o vetor de coeficientes do polinômio de Newton
    n = length(x) - 1;  % Grau do polinômio
    coeficientes = zeros(1, n+1);  % Vetor para armazenar os coeficientes do polinômio expandido

    % Primeiro termo (a_0)
    coeficientes(end) = coef(1);  % O termo independente do polinômio é sempre o primeiro coeficiente

    % Constrói os coeficientes do polinômio expandido
    for i = 2:length(coef)
        % Cada termo de diferença dividida corresponde a um produto da forma
        % coef(i) * (x - x_0)(x - x_1)...(x - x_{i-1})

        % Inicializa o termo com o coeficiente atual
        termo_atual = coef(i);

        % Multiplica pelo produto de (x - x_j) correspondente
        produto = poly(x(1:i-1));  % Cria o polinômio (x - x_0)(x - x_1)... em forma de vetor de coeficientes

        % Atualiza o vetor de coeficientes somando o novo termo expandido
        coeficientes = coeficientes + termo_atual * [zeros(1, length(coeficientes) - length(produto)), produto];
    endfor
endfunction
