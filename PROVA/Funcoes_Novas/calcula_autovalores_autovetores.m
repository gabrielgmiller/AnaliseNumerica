function [autovalores, autovetores] = calcula_autovalores_autovetores(A)
    % Calcula os autovalores e autovetores da matriz A
    [autovetores, autovalores_diag] = eig(A);

    % Os autovalores estão na diagonal da matriz autovalores_diag
    autovalores = extrai_diagonal(autovalores_diag);
end
