function x = decomposicao_LU_s_P(A,b)
  % Lembra de importar a substituicao sucessiva, retroativa, gauss e cholesky junto
	U = eliminacao_gauss_M_only(A)
	L = decomposicao_cholesky(A)
	n = size(A,1);
	y = substituicao_sucessiva(L, b);
	x = substituicao_retroativa(U, y);
endfunction
