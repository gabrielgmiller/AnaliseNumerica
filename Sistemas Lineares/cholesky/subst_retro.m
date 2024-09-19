function x = subst_retro(U, d)
  if size(U, 1) == size(U, 2) && size(d, 1) == size(U, 1)
    resultado = 1;
    for i = 1:size(U, 1)
      for j = 1:size(U, 1)
        if i > j && U(i, j) ~= 0
          resultado = 0;
        endif
      endfor
    endfor
    if resultado == 1
      n = size(U, 1);
      x(n) = d(n) / U(n, n);
      for i = n-1:-1:1
        soma = 0;
        for j = i+1:n
          soma = soma + U(i, j) * x(j);
        endfor
        x(i) = (d(i) - soma) / U(i, i);
      endfor
    else
      printf('A matriz U não é triangular superior.');
    endif
  else
    printf('As dimensões da matriz U ou vetor d são inválidas.');
  endif
endfunction
