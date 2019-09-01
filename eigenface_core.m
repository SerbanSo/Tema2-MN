function [m A eigenfaces pr_img] = eigenface_core(database_path)
  
  for i = 1:10
    %citirea fiecarei imagini din folderul dataset
    image_matrix = double(rgb2gray(imread(strcat(database_path, "/", num2str(i), ".jpg"))));
    [p n] = size(image_matrix);
    
    %determinarea matricei T
    T(:, i) = image_matrix'(:);
  endfor
  
  %media pe linie a matrice T
  m = 1/10*sum(T, 2);
  
  %calculul matricei A
  A = T - m;
  
  %calculul matricei eigenfaces
  [V S] = eig(A'*A);
  %se iau doar vectorii propri corespunzatori valorilor proprii > 1
  j = 1;
  for i = 1:10
    if sum(S(:,i)) > 1
      B(:, j) = V(:, i);
      j++;
    endif
  endfor
  eigenfaces = A * V;
  
  %calculul proiectiei fiecarei imagini
  pr_img = eigenfaces' * A;  
end