function [MatX, Info] = matriz_explicativas(n, v, p, ii, x)
  % Lembrando que as saidas entradas são aquelas que estao no regressao linear
  if p < v
    Info = 1;
    return;
  endif
  if ii ~= 1 && ii ~= 0
    Info = 2;
    return;
  endif
  if (v ~= 1 || v > p) && (v <= 1 || (v + ii) ~= p)
    Info = 3;
    MatX = 0;
    return;
  endif
  Info = 0;
  if v == 1 % Regressao polinomial
    if ii ~= 0 % Modelo com intersecao
      for i = 1 : n
        MatX(i, 1) = 1;
      endfor
    else % Modelo sem intersecao
      for i = 1 : n
        MatX(i, 1) = x(i, 1);
      endfor
    endif
    # Completa a matriz MatX com potencias do vetor coluna x(i,1)
    for j = 2 : p
      j1 = j - 1;
      for i = 1 : n
        MatX(i, j) = MatX(i, j1)*x(i,1);
      endfor
    endfor
  else % Regressao linear multipla
    if ii ~= 0
      for i = 1 : n
        MatX(i,1) = 1;
      endfor
    endif
    % Copia a submatriz x na matrix MatX
    m = 0;
    for j = ii+1 : p
      m = m+1;
      for i = 1 : n
        MatX(i, j) = x(i, m);
      endfor
    endfor
  endif
endfunction
