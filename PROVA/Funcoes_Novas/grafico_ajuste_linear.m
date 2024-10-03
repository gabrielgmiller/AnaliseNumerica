function grafico_ajuste_linear(x, y , coef, x_min, x_max)
    % Gerar valores de x para o gráfico
    % Ex para não esquecer:
    % coeficientes = regressao_linear_en(n, v, p, ii, x, y) (Lembra que b(1) = x^0, b(2) = x^1....)
    % Tambem lembrar que esta função tambem é grafico de dispersao
    x_graf = linspace(x_min, x_max, 100);
    y_graf = zeros(size(x_graf));

    % Calcular o valor do polinômio em cada ponto
    for i = 1:length(x_graf)
        y_graf(i) = avaliar_polinomio_regressao_porcoef(coef, x_graf(i));
    endfor

    % Gerar o gráfico
    plot(x_graf, y_graf, '-b', 'LineWidth', 2);
    hold on;

    % Plotar os pontos originais usados
    plot(x, y, 'ro', 'MarkerFaceColor', 'r');

    % Adicionar títulos e rótulos
    title('Gráfico do Ajuste Linear');
    xlabel('x');
    ylabel('p(x)');

    % Mostrar grade no gráfico
    grid on;
    hold off;
endfunction
