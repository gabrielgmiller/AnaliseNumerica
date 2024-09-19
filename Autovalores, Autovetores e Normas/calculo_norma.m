function norma = calculo_norma(x, tipo)
  % tipo: 'euclidiana', 'max', '1', 'inf'
  if nargin < 2
    tipo = 'euclidiana';
  end

  switch tipo
    case 'euclidiana'
      norma = norm(x, 2);
    case 'max'
      norma = max(abs(x));
    case '1'
      norma = norm(x, 1);
    case 'inf'
      norma = norm(x, inf);
    otherwise
      error('Tipo de norma desconhecido.');
  end
end

% Exemplo de uso:
% v = [1, -2, 3];
% norma_euclidiana = calculo_norma(v, 'euclidiana');
% norma_max = calculo_norma(v, 'max');
% fprintf('Norma Euclidiana: %f\n', norma_euclidiana);
% fprintf('Norma Máxima: %f\n', norma_max);

