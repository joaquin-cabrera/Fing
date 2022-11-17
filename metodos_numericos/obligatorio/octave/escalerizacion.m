## matriz de prueba
A = [1 2 3 7; 2 9 5 1; 7 2 4 7];


function M = escalerizar(M)
  [n,m] = size(M);
  for i = 1 : n
    pivot = M(i,i);
    # escalerizar valores de abajo #
    for j = i + 1 : n
      l = (M(j,i)/pivot);
      # restar el valor a la fila #
      for h = i : m
        M(j,h) = M(j,h) - l*M(i,h);
      endfor
    endfor
  endfor
endfunction

# imprimir A, y la forma triangular superior de A
A
T = escalerizar(A)
disp("  (Escalerizada)\n");




