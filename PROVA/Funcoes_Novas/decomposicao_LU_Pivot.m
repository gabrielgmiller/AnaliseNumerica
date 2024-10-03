function x = decomposicao_LU_Pivot(A,b)
  % Lembra de importar a substituicao sucessiva, retroativa e gaussLU junto
  % Pivota a matriz A e arruma b
  [A,P] = pivotar_matriz(A);
  b = P * b;

	[L,U]= eliminacao_gauss_com_pivotacaoLU(A)
	n = size(A,1);
	y = substituicao_sucessiva(L, b);
	x = substituicao_retroativa(U, y);
endfunction
