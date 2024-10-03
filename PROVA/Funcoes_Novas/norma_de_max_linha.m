function l = norma_de_max_linha(A,i)
  if (i>size(A,i))||(i<0)
    error("Linha inválida")
  endif
  lsum = abs(sum(A,i));
  l = max(lsum);
  endfunction
