function [b, r2, s2, AICc, Info]  = regressao_linear_en(n, v, p, ii, x, y)
  % n : numero de pontos
  % v : numero de variaveis explicativas, assim determina se é polinomial ou multipla
  % p : numero de parametros do modelo (Ex: x e y = 2)
  % ii : indicacao de intersecao
  % x e y : variaveis explicativas originais e variaveis respostas
  % Saida:
  % b : estimadores dos parametros (Lembra que b(1) = x^0, b(2) = x^1....)
  % r2 : coef. determinacao
  % s2 : quad. medio residual (Lembrar que é mais para fazer a comparacao entre modelos)
  % AICc : criterio de informacao Akaike, ler no livro se esquecer, mas lembra que é para significar se e simples ou n
  % Info:
  % Info = 0: sem erro
  % Info = 1: p < v
  % Info = 2: (ii != 1 e ii != 0)
  % Info = 3: modelo nao permitido (v != 1 ou v > p) e (v <= 1 ou v + ii != p)
  % Info = 4: matriz das equacoes normais nao e definida positiva
  % Para achar o vertice v : -b(2) / (2 * b(3));
  % Valor de y : b(1) + b(2)*v + b(3)*v^2;
  [MatX, Info] = matriz_explicativas(n, v, p, ii, x);
  if Info ~= 0
    return;
  endif
  % Montagem das equacoes normais
  for i = 1 : p
    for j = 1 : i
      Soma = 0;
      for k = 1 : n
        Soma = Soma + MatX(k,i)*MatX(k,j);
      endfor
      Sxx(i,j) = Soma; % Matriz dos coeficientes
      if i ~= j
        Sxx(j,i) = Soma;
      endif
    endfor
    Soma = 0;
    for k = 1 : n
      Soma = Soma + MatX(k,i)*y(k);
    endfor
    Sxy(i) = Soma; % Vetor dos termos independentes
  endfor
  % Solucao do sistema linear pela decomposicao de Cholesky
  [L, Info] = decomposicao_cholesky(Sxx);
  if Info ~= 0
    Info = 4;
    return;
  endif
  L = tril(L);
  t = substituicao_sucessiva(L, Sxy');
  for i = 1 : p
    for j = 1 : i
      U(j,i) = L(i,j); % U = transposta de L
    endfor
  endfor
  % Estimadores de quadraos minimos dos parametros da equacao de regressao
  b = substituicao_retroativa(U, t');
  Info = 0;
  S = 0;
  Sy2 = 0;
  for i = 1 : n
    u = 0;
    for j = 1 : p
      u = u + MatX(i,j)*b(j);
    endfor
    S = S + (y(i) - u)^2;
    Sy2 = Sy2 + y(i)^2;
  endfor
  % Coeficiente de determinacao
  if ii == 1
    r2 = 1 - S/(Sy2 - (Sxy(1)^2)/n);
  else
    r2 = 1 - S/Sy2;
  endif
  s2 = S/(n-p); % Quadrado medio residual
  AICc = n*log(S/n) + 2*p*n/(n-p-1); % Criterio de informacao Akaike
endfunction
