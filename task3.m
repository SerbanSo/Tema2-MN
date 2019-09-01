function [A_k S] = task3(image, k)
  %citirea matricei de pixeli
  A = double(imread(image));
  [m n] = size(A);
  
  %media pentru fiecare linie din A + actualizarea liniilor
  for i = 1:m
    u(i) = sum(A(i, 1:n))/n;
    A(i, 1:n) = A(i, 1:n) - u(i);
  endfor
  
  %construirea matricei Z
  Z = A'/sqrt(n-1);

  %DVS pentru Z
  [U S V] = svd(Z);
  
  %determinare W
  W = V(1:m, 1:k);
  
  %determinare Y
  Y = W' * A;
  
  %aproximarea A_k
  u = u'; % transformare u in vector coloana
  A_k = W * Y + u;
endfunction