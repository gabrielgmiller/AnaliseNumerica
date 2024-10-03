function x = substituicao_sucessiva(L, b)
  % Lembrando que L e matriz inferior (Lower)
  n = length(b);
  x = zeros(n, 1);

  for i = 1:n
    somatorio = L(i, 1:i-1) * x(1:i-1);
    x(i) = (b(i) - somatorio) / L(i, i);
  endfor
endfunction
