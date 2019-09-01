function A_k = task1(image, k)
  %citirea matricei de pixeli
  image_matrix = double(imread(image));
  [m n] = size(image_matrix);
  
  %determinarea matricilor U_k S_k si V_k
  [U S V] = svd(image_matrix);
  
  %calcularea matricei A_k
  V = V';
  A_k = U(1:m, 1:k) * S(1:k, 1:k) * V(1:k, 1:n);
endfunction