function y = subst_sucess_pivotal (L, b, Pivot)
  n = size(L, 1);
  k = Pivot(1);
  y(1) = b(k);
  for i = 2 : n
    Soma = 0;
    for j = 1 : i-1
      Soma = Soma + L(i,j) * y(j);
    endfor
    k = Pivot(i);
    y(i) = b(k) - Soma;
  endfor
endfunction
