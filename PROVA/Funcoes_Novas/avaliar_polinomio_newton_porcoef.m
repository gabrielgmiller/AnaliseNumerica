function p = avaliar_polinomio_newton_porcoef(coef, x_val)
    n = length(coef);
    p = 0;
    for k = 1 : n
        p = coef(k)*x_val.^(n-k) + p;
    endfor
endfunction

