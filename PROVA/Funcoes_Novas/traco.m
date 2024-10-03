function sum = traco(A)
  sum = 0;
  n = size(A,1);
  for i = 1 : n
    sum = sum + A(i,i);
  endfor
endfunction
