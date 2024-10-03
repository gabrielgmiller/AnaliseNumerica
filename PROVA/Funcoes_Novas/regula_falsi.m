function [Raiz, Iter, Info] = regula_falsi(a, b, Toler, IterMax, f)
  % baseado em interpolação linear.
  % f = @(x) x^2 + 3*x + 2;
  % a e b : limite min e max
  % Toler : Tolerancia
  % Intermax : Maximo de iteracoes
  % f : funcao
  % Saida:
  % Raiz : raiz encontrada
  % Iter : numero de iteracoes
  % Info : Informacao sobre convergencia
  %      Info = -1 : funcao nao muda de sinal nos extremos no intervalo
  %      Info = 0 : raiz calculada com sucesso
  %      Info = 1 : raiz nao convergiu com parametros dados
  Fa = f(a);
  Fb = f(b);
  % verificar se a funcao muda de sinal nos extremos de [a,b]
  if (Fa*Fb > 0)
    Info = -1;
    return;
  endif
  Iter = 0;
  while 1
    deltax = Fb*(b-a)/(Fb - Fa);
    x = b-deltax;
    Fx = f(x); % avaliar a funcao em x
    if ((abs(deltax) <= Toler && abs(Fx) <= Toler) || Iter >= IterMax)
      break;
    endif
    % atribuicao dos novos pontos base2dec
    if (Fb*Fx < 0)
      a = b;
      Fa = Fb;
    endif
    b = x;
    Fb = Fx;
    Iter = Iter + 1;
  endwhile
  Raiz = x;
  % teste de convergencia
  if ((abs(deltax) <= Toler) && abs(Fx) <= Toler)
    Info = 0;
  else
    Info = 1;
  endif
endfunction
