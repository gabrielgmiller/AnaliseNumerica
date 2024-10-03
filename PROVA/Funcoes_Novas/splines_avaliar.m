function [sz, Info] = splines_avaliar(n, x, y, m, z, ts)
  % Utilizar com splines_naturais e splines_extrapolados

  % Exemplo para lembrar:
  % tempo = [60; 80; 100; 120; 140; 160; 180]
  % posi = [76; 95; 112; 138; 151; 170; 192]
  % tempz = [95; 130; 170]
  % [sz, Info] = splines_avaliar(7, tempo, posi, 3, tempz, 0)
  % Entradas:
  % numero de pontos, vetor de abscissas em ordem crescente, vetor de ordenadas,
  % numero de pontos a interpolar, valores a interpolar e tipo de splines_avaliar
  % Saidas
  % valores interpolados e informacao sobre erro, sendo Info = 0: sem erro, Info = -1:
  % numero de pontos de n<3 ou n <4 (depende do spline), Info = -2: abscissas nao estao
  % em ordem crescente e Info > 0: numero de tentativas de extrapolacao.
  if ts == 0
    [s2, Info] = splines_naturais(n,x,y);
  else
    [s2, Info] = splines_extrapolados(n,x,y);
  endif
  if Info < 0
    return;
  endif
  Info = 0;
  for j = 1 : m
    if (z(j) >= x(1)) && (z(j) <=  x(n))
      # Pesquisa binarios para localizar o intervalo
      inf = 1;
      sup = n;
      while 1
        if (sup - inf) <= 1
          break;
        endif
        ind  = round((inf+sup)/2);
        if x(ind) > z(j)
          sup = ind;
        else
          inf = ind;
        endif
      endwhile
      % Avaliacao do spline pelo metodo de Horner
      h = x(sup) - x(inf);
      a = (s2(sup)-s2(inf))/(6*h);
      b = s2(inf)/2;
      c = (y(sup)-y(inf))/h-(s2(sup)+2*s2(inf))*h/6;
      d = y(inf);
      h = z(j)-x(inf);
      sz(j)=((a*h+b)*h+c)*h+d;
    else
      sz(j) = 0;
      Info = Info + 1;
    endif
  endfor
endfunction
