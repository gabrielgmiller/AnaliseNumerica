function [Raiz, Zero, Iter, Info] = pegaso_rm(a, b, Toler, IterMax, f, f_der)
  % baseado em interpolação linear.
  % f = @(x) x^2 + 3*x + 2;
  % a e b : limite min e max
  % Toler : Tolerancia
  % Intermax : Maximo de iteracoes
  % f : funcao
  % f_der : primeira derivada de f : use diff(f,x) para conseguir derivada
  % Saida:
  % Raiz : raiz encontrada
  % Zero : f da raiz
  % Iter : numero de iteracoes
  % Info : Informacao sobre convergencia
  %      Info = 0 : raiz calculada com sucesso e
  %      Info = 1 : raiz nao convergiu com parametros dados
  %      Info = 2 : derivada se anula
  Epsilon = precisao_maquina();
  Fa = f(a);
  DFa = f_der(a); % avaliar a funcao e sua derivada em a
  Fb = f(b);
  DFb = f_der(b); % avaliar a funcao e sua derivada em b
  if (abs(DFa) < Epsilon || abs(DFb) < Epsilon)
    Info = 2;
    return;
  endif
  Ga = Fa/DFa;
  Gb = Fb/DFb;
  Gx = 1 + Toler;
  Iter = 0;
  while 1
    deltax = Gb*(b-a)/(Gb-Ga);
    x = b - deltax;
    Fx = f(x);
    DFx = f_der(x); % avaliar a funcao e sua derivada em x
    if ((abs(deltax) <= Toler && abs(Gx) <= Toler) || abs(DFx) < Epsilon || Iter >= IterMax)
      break;
    endif
    Gx = Fx/DFx;
    % atribuicao dos novos pontos base
    if (Gb*Gx < 0)
      a = b;
      Ga = Gb;
    else
      Ga = Ga*Gb/(Gb+Gx); % a abscissa a se mantem inalterada
    endif
    b = x;
    Gb = Gx;
    Iter = Iter + 1;
  endwhile
  Raiz = x;
  Zero = f(Raiz); % avaliar a funcao em Raiz
  % teste de convergencia
  if (abs(deltax) <= Toler && abs(Gx) <= Toler)
    Info = 0;
  else
    if (abs(DFx) >= Epsilon)
      Info = 1;
    else
      Info = 2;
    endif
  endif
endfunction
