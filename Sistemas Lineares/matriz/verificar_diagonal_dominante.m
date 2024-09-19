function e_diag_dom = verificar_diagonal_dominante(A)
  n = size(A, 1);
  e_diag_dom = true;

  for i = 1:n
    elem_diag = abs(A(i, i));
    soma_off_diag = sum(abs(A(i, :))) - elem_diag;
    if elem_diag < soma_off_diag
      e_diag_dom = false;
      return;
    end
  end
end
