function x = subst_sucess (L, c)
  if size(L, 1) == size(L, 2) && size(c, 1) == size(L, 1)
    resultado = 1;
    for i = 1 : size(L ,1)
      for j = i+1 : size(L, 1)
        if L(i, j) ~= 0
          resultado = 0;
        endif
      endfor
    endfor
    if resultado == 1
      n = size(L, 1);
      x(1) = c(1) / L(1, 1);
      for i = 2 : n
        soma = 0;
        for j = 1 : i-1
          soma = soma + (L(i, j) * x(j));
        endfor
        x(i) = (c(i) - soma) / L(i, i);
      endfor
    else
      printf('A matriz L não é triangular inferior.');
    endif
  else
    printf('As dimensões da matriz L ou vetor c são inválidas.');
  endif
endfunction
