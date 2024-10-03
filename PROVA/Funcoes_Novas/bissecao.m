function [Raiz, Iter, Info] = bissecao(a, b, Toler, IterMax, f)
  % a e b : limite superior e inferior
  % Toler : Tolerancia
  % IterMax : Maximo de iteracoes
  % f : Função
  % Saida: raiz da equacao, numero gasto de iteracoes e informacao sobre erro, sendo
  %  Info = -1 : funcao nao muda de sinal nos extremos do intervalo
  %  Info = 0 : raiz encontrada
  %  Info = 1 : raiz nao convergiu com os  parametros dados
  Fa = f(a); % Avaliar a funcao em a e b
  Fb = f(b);
  if Fa*Fb > 0
    Info = -1;
    return;
  endif
  deltax = abs(b-a);
  Iter = 0;
  while 1
    deltax = deltax/2;
    x = (a+b)/2;
    Fx = f(x);
    if ((deltax <= Toler && abs(Fx) <= Toler) || Iter >= IterMax)
      break;
    endif
    % escolha dos novos pontos
    if Fa*Fx > 0
      a = x;
      Fa = Fx;
    else
      b = x;
      Fb = Fx;
    endif
    Iter = Iter + 1;
  endwhile
  Raiz = x;
  % Teste de convergencia
  if deltax >= Toler || abs(Fx) <= Toler
    Info = 0;
  else
    Info = 1;
  endif
endfunction
