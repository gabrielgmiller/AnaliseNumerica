function [L,Info] = decomposicao_cholesky(A)
    % Verifica se a matriz é simétrica e positiva definida
    Info = 0;
    if ~isequal(A, A')
        disp('A matriz deve ser simétrica.');
        Info = 1;
        return;
    endif
    if min(eig(A)) <= 0
        disp('A matriz deve ser positiva definida.');
        Info = 1;
        return;
    endif

    % Obtém o tamanho da matriz A
    n = size(A, 1);
    L = zeros(n); % Inicializa a matriz L com zeros

    for i = 1:n
        for j = 1:i
            if i == j
                % Elementos diagonais de L
                L(i, j) = sqrt(A(i, i) - sum(L(i, 1:j-1).^2));
            else
                % Elementos abaixo da diagonal
                L(i, j) = (A(i, j) - sum(L(i, 1:j-1).*L(j, 1:j-1))) / L(j, j);
            endif
        endfor
    endfor
endfunction
