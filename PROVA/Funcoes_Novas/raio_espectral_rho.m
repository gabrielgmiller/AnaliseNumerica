function VF = raio_espectral_rho(A)
  % Lembrar de usar com jacobi_AA
  [V,D] = jacobi_AA(A);
  val = max(max(abs(V)));
  if( val < 1)
    VF = 1; % Ou seja o rho é menor que 1 que diz que a matriz converge
  else
    VF = 0;
  endif
  endfunction
