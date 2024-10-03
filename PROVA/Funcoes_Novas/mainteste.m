% Dados dos dias (convertendo as datas em dias do mês de junho/julho)
x = [1, 16, 31, 46]'; % Dias correspondentes a 01/06, 16/06, 01/07 e 16/07 (vetor coluna)

% Convertendo a duração dos dias em horas decimais
y = [20 + 56/60, 22 + 24/60, 22 + 1/60, 20 + 44/60]'; % Durações dos dias em horas (vetor coluna)

% Número de pontos
n = length(x);

% Número de variáveis explicativas (polinômio de grau 2, então v = 1 para o x e seus poderes)
v = 1;

% Número de parâmetros (grau 2 do polinômio, então p = 3 para os coeficientes de x^0, x^1 e x^2)
p = 3;

% Indicação de interseção
ii = 1; % Consideramos o termo de interseção (x^0)

% Chama a função de regressão polinomial
[b, r2, s2, AICc, Info] = regressao_linear_en(n, v, p, ii, x, y);

% Verifica se ocorreu algum erro
if Info != 0
    fprintf('Erro na execução: Info = %d\n', Info);
    return;
endif

% Exibe os resultados
fprintf('Coeficientes do polinômio ajustado: %.4f + %.4fx + %.4fx^2\n', b(1), b(2), b(3));
fprintf('Coeficiente de determinação (R²): %.4f\n', r2);
fprintf('Quadrado médio residual: %.4f\n', s2);
fprintf('AIC corrigido (AICc): %.4f\n', AICc);

% Encontrar o dia do máximo (vértice da parábola)
dia_max = -b(2) / (2 * b(3));
duracao_max = b(1) + b(2)*dia_max + b(3)*dia_max^2;
fprintf('O dia mais longo ocorre em %.2f dias após 01/06, com duração de %.2f horas.\n', dia_max, duracao_max);
grafico_ajuste_linear(x, y , b, 1, 46);
