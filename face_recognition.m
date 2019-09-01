function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %citirea si transformarea imaginii de test intr-un vector coloana
  image_matrix = double(rgb2gray(imread(image_path)));
  [p n] = size(image_matrix);
  T = image_matrix'(1:p*n);
  T = T';  
  
  %calculul matricei A
  A = T - m;
  
  %calculul proiectiei imaginii
  PrTestImg = eigenfaces' * A;
  
  %determinarea distantei minime intre proiectia imaginii de test si
  %proiectiile imaginilor ce formeaza database-ul
  min_dist = norm(PrTestImg - pr_img(:, 1));
  output_img_index = 1;
  for i = 2:10
    tmp = norm(PrTestImg - pr_img(:, i)); 
    if(tmp < min_dist)
      min_dist = tmp;
      output_img_index = i;
    endif
  endfor
end