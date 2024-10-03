function grafico_polinomio_newton(x, coef, x_min, x_max)
    % Gerar valores de x para o gráfico
    % Ex para não esquecer:
    % coeficientes = polinomio_newton_coef(x, y)
    % grafico_polinomio_newton(x, coeficientes, menor valor de x, maior valor de x)
    x_graf = linspace(x_min, x_max, 100);
    y_graf = zeros(size(x_graf));

    % Calcular o valor do polinômio em cada ponto
    for i = 1:length(x_graf)
        y_graf(i) = avaliar_polinomio_newton_porcoef(coef, x_graf(i));
    endfor

    % Gerar o gráfico
    plot(x_graf, y_graf, '-b', 'LineWidth', 2);
    hold on;

    % Plotar os pontos originais usados na interpolação
    plot(x, avaliar_polinomio_newton_porcoef(coef, x), 'ro', 'MarkerFaceColor', 'r');

    % Adicionar títulos e rótulos
    title('Gráfico do Polinômio Interpolador de Newton');
    xlabel('x');
    ylabel('p(x)');

    % Mostrar grade no gráfico
    grid on;
    hold off;
endfunction
