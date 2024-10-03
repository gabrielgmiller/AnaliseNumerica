function [Raiz, Iter, Info] = halley(x, Toler, IterMax, f, f_der, f_der2)
  % x : valor inicial
  % Toler : Tolerancia
  % Intermax : Maximo de iteracoes
  % f : funcao
  % f_der : primeira derivada de f : use diff(f,x) para conseguir derivada
  % f_der2 : segunda derivada de f
  % Saida:
  % Raiz : raiz encontrada
  % Iter : numero de iteracoes
  % Info : Informacao sobre convergencia
  %      Info = 0 : raiz calculada com sucesso e
  %      Info = 1 : raiz nao convergiu com parametros dados
  deltax = 1 + Toler;
  Iter = 0;
  while 1
    Fx = f(x);
    DFx = f_der(x); % avaliar a funcao e sua derivada em x
    if ((abs(deltax) <= Toler && abs(Fx) <= Toler) || Iter > IterMax)
      break;
    endif
    D2Fx = f_der2(x); % avaliar a derivada segunda em x
    deltax = 2*Fx*DFx/(2*DFx^2 - Fx*D2Fx);
    x = x - deltax;
    Iter = Iter + 1;
  endwhile
  Raiz = x;
  % teste de convergencia
  if (abs(deltax) <= Toler && abs(Fx) <= Toler)
    Info = 0;
  else
    Info = 1;
  endif
endfunction
