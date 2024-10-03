function x = substituicao_retroativa(U, b)
  % Lembrando que U e matriz superior (Upper)
  n = length(b);
  x = zeros(n, 1);


  for i = n:-1:1
    somatorio = U(i, i+1:n) * x(i+1:n);
    x(i) = (b(i) - somatorio) / U(i, i);
  endfor
endfunction
