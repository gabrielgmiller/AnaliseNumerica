function norma_frob = frobenius_norma(A)
    norma_frob = sqrt(sum(sum(A.^2))); %a raiz das duas somas dos quadrados de A
end
