function s = sensibilidade(A, b , be)
  % Lembrar de utilizar com norma infinita e numero_de_condicao
  % E lembra que be é o vetor resposta com error
  % Tem que ser maior que: norma de Deltax/norma de (x)
  k = numero_de_condicao(A);
  Ob = b - be;
  Obinf = norma_infinita(Ob);
  binf = norma_infinita(b);
  s = k * (Obinf/binf);
  endfunction
