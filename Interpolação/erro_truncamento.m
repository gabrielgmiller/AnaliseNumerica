function erro = erro_truncamento(valor_exato, valor_aproximado)
  erro = abs(valor_exato - valor_aproximado);
end

% Exemplo de uso:
% valor_exato = 3.14159;
% valor_aproximado = 3.14;
% erro = erro_truncamento(valor_exato, valor_aproximado);
% fprintf('Erro de truncamento: %f\n', erro);

