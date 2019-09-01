function task5() 
  image = "in/images/image4.gif";
  A = double(imread(image));
  [m n] = size(A);

  %*****Task5.1*****
  [A_k S] = task3(image, min(m, n));

  figure 1
  %desenare grafic
  plot(1:min(m, n), diag(S));


  %*****Task5.2*****
  i = 1;
  sum1 = trace(S);
  for k = 1:min(m, n)
    %aplicarea formulei si adaugarea elementelor in vectorul v
    sum2 = trace(S(1:k, 1:k));
    v(i) = sum2/sum1;
    i++;
  endfor

  figure 2
  %desenare grafic
  plot(1:i-1, v);


  %*****Task5.3*****
  i = 1;
  for k = 1:min(m, n)
    %aplicarea formulei si adaugarea elementelor in vectorul v
    [A_k S] = task3(image, k);
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


  %*****Task5.4*****
  i = 1;
  for k = 1:min(m, n)
    %aplicarea formulei si adaugarea elementelor in vectorul v
    v(i) = (2*k+1)/n;
    i++;
  endfor

  figure 4
  %desenare grafic
  plot(1:i-1, v);

end