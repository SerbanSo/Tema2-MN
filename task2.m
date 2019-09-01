function task2()
  image = "in/images/image4.gif";
  A = double(imread(image));
  [m n] = size(A);

  %*****Task2.1*****
  [U S V] = svd(A);

  figure 1
  %desenare grafic
  plot(1:min(m, n), diag(S));


  %*****Task2.2*****
  sum1 = trace(S);
  i = 1;
  for k = 1:min(m, n)
    %aplicarea formulei si adaugarea elementelor in vectorul v
    sum2 = trace(S(1:k, 1:k));
    v(i) = sum2/sum1;
    i++;
  endfor

  figure 2
  %desenare grafic
  plot(1:i - 1, v);


  %*****Task2.3*****
  i = 1;
  for k = 1:min(m, n)
    %aplicarea formulei si adaugarea elementelor in vectorul v
    A_k = task1(image, k);
    sum1 = 0;
    for z = 1:m
      sum1 = sum1 + norm(A(z, 1:n) - A_k(z, 1:n))^2;
    endfor
    v(i) = sum1/(m*n);
    i++;
  endfor

  figure 3
  %desenare grafic
  plot(1:i - 1, v);


  %*****Task2.4*****
  i = 1;
  for k = 1:min(m, n)
    %aplicarea formulei si adaugarea elementelor in vectorul v
    v(i) = (m*k + n*k + k)/(m*n);
    i++;
  endfor

  figure 4
  %desenare grafic
  plot(1:i - 1, v);

endfunction