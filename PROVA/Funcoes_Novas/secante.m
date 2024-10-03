function [Raiz, Iter, Info] = secante(a, b, Toler, IterMax, f)
  % baseado em interpolação linear.
  % f = @(x) x^2 + 3*x + 2;
  % Lembrar de trazer a funcao Precisao_maquina junto
  % a e b : limite min e max
  % Toler : Tolerancia
  % Intermax : Maximo de iteracoes
  % f : funcao
  % Saida:
  % Raiz : raiz encontrada
  % Iter : numero de iteracoes
  % Info : Informacao sobre convergencia
  %    Info = 0 : raiz calculada com sucesso
  %    Info = 1 : raiz nao convergiu com parametros dados
  %    Info = 2 : raiz calculada esta fora do intervalo
  Epsilon = precisao_maquina();
  Fa = f(a);
  Fb = f(b); % avaliar a funcao em a e b
  a0 = a;
  b0 = b;
  Iter = 0;
  while 1
    deltax = Fb*(b-a)/(Fb - Fa);
    x = b - deltax;
    Fx = f(x); % avaliar a funcao em x
    if ((abs(deltax) <= Toler && abs(Fx) <= Toler) || abs(Fb - Fx) < Epsilon || Iter > IterMax)
      break;
    endif
    % atribuicao dos novos pontos base
    a = b;
    Fa = Fb;
    b = x;
    Fb = Fx;
    Iter = Iter+1;
  endwhile
  Raiz = x;
  % teste de convergencia
  if (abs(deltax) <= Toler && abs(Fx) <= Toler)
    if (Raiz >= a && Raiz <= b)
      Info = 0;
    else
      Info = 2;
    endif
  else
    Info = 1;
  endif
endfunction
