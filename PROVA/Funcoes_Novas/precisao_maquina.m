function epsilon = precisao_maquina
  % Usar como o metodo de NP e essa funcao so ta aqui para medir a precisao da maquina
  Eps1 = 1;
  while 1
    if (1 + Eps1) <= 1
      break;
    endif
    epsilon = Eps1;
    Eps1 = Eps1/2;
  endwhile
endfunction
