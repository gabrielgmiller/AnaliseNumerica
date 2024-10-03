function [Raiz, Iter, Info] = muller(a, b, Toler, IterMax, f)
  % a e b : limites min e max
  % Toler : Tolerancia
  % Intermax : Maximo de iteracoes
  % f : funcao
  % Saida:
  % Raiz : raiz encontrada
  % Iter : numero de iteracoes
  % Info : Informacao sobre convergencia
  %      Info = 0 : raiz calculada com sucesso e
  %      Info = 1 : raiz nao convergiu com parametros dados
  Fa = f(a);
  Fb = f(b); % avaliar a funcao em a e b
  % obtencao do terceiro ponto para interpolacao quadratica via bissecao
  x = (a+b)/2;
  Fx = f(x); % avaliar a funcao em x
  Iter = 0;
  while 1
    ha = x-a;
    hb = b-x;
    Da = (Fa-Fx)/ha;
    Db = (Fb-Fx)/hb;
    AA = (Da+Db)/(ha+hb);
    BB = (ha*Db - hb*Da)/(ha + hb);
    CC = Fx;
    Delta = sqrt(BB^2 - 4*AA*CC);
    if (abs(BB + Delta) > abs(BB - Delta))
      v = -2*CC/(BB + Delta);
    else
      v = -2*CC/(BB - Delta);
    endif
    t = x;
    Ft = Fx;
    x = x + v;
    Fx = f(x); % avaliar a funcao em x
    if((abs(v) <= Toler && abs(Fx) <= Toler) || Iter >= IterMax)
      break;
    endif
    % atribuicao de novos pontos base
    a = b;
    Fa = Fb;
    b = t;
    Fb = Ft;
    Iter = Iter + 1;
  endwhile
  Raiz = x;
  % teste de convergencia
  if (abs(v) <= Toler && abs(Fx) <= Toler)
    Info = 0;
  else
    Info = 1;
  endif
endfunction
