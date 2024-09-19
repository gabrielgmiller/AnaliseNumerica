function posto = calcular_posto(matriz)
  [linhas, colunas] = size(matriz);
  if linhas ~= colunas
    error('A matriz deve ser quadrada.');
  end

  autovalores = eig(matriz);

  posto = sum(autovalores ~= 0);

  disp(['O posto da matriz é: ', num2str(posto)]);
endfunction
