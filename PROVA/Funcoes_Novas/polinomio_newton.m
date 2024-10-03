function P = polinomio_newton(x, y, x_val)
    % usar a funcao  diferencas_divididas junto
    % x: vetor com os valores de x
    % y: vetor com os valores de y
    % x_val: valor de x onde queremos avaliar o polinômio de Newton
    % Retorna o valor do polinômio de Newton avaliado em x_val
    % Mas da preferencia por avaliar or coeficientes que achei melhor
    % Ou seja, usa polinomio_newton_coef(x, y)

    % Calcula a tabela de diferenças divididas
    tabela_dd = diferencas_divididas(x, y);

    % O vetor de diferenças divididas (primeira linha da tabela)
    coef = tabela_dd(1, :);

    % Inicializa o valor do polinômio com o primeiro coeficiente
    P = coef(1);

    % Calcula o valor do polinômio em x_val
    termo_prod = 1;
    for i = 2:length(x)
        termo_prod = termo_prod * (x_val - x(i-1));  % Produto acumulado (x - x_k)
        P = P + coef(i) * termo_prod;  % Soma ao polinômio o próximo termo
    endfor
endfunction
