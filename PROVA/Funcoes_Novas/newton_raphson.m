function [Raiz, Iter, Info] = newton_raphson(x, Toler, IterMax, f, f_der)
  % Lembra de trazer a funcao Precisao_maquina junto
  % x : valor inicial
  % Toler : Tolerancia
  % Intermax : Maximo de iteracoes
  % f : funcao
  % f_der : primeira derivada de f : use diff(f,x) para conseguir derivada
  % Saida:
  % Raiz : raiz encontrada
  % Iter : numero de iteracoes
  % Info : Informacao sobre convergencia
  %      Info = 0 : raiz calculada com sucesso e
  %      Info = 1 : raiz nao convergiu com parametros dados
  Epsilon = precisao_maquina();
  deltax = 1 + Toler;
  Iter = 0;
  while 1
    Fx = f(x);
    DFx = f_der(x); % avaliar a funcao e sua derivada em x
    if ((abs(deltax) <= Toler && abs(Fx) <= Toler) || abs(DFx) < Epsilon || Iter >= IterMax)
      break;
    endif
    deltax = Fx/DFx;
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
