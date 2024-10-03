function P = interpola_sist_linear(x, x0, y0, x1, y1)
  % Só lembrar que x é para o ponto desejado
  % E tambem lebrar que só precisa de 2 pontos conhecidos
  P = y0 + ((y1-y0)/(x1-x0))*(x - x0);
endfunction
