function [A, Det, Info] = Cholesky (A)
    n = size(A, 1);
    Info  = 0;
    Det = 1;
    for j = 1 : n
      Soma = 0;
      for k = 1 : j - 1
        Soma = Soma + A(j,k)*A(j,k);
      endfor
      t = A(j,j) - Soma;
      if t > 0
        A(j,j) = sqrt(t);
        r = 1/A(j,j);
        Det = Det * t;
      else
        Info = j;
        disp('A matriz nao e definida positiva');
        return;
      endif
      for i = j+1 : n
        Soma = 0;
        for k=1 : j-1
          Soma = Soma + A(i,k) * A(j,k);
        endfor
        A(i,j) = (A(i,j) - Soma) * r;
      endfor
    endfor
endfunction
