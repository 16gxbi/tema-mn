function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best num_recoms recommandations similar with 'liked_theme'.

  % Citim matricea de recenzii
  mat=read_mat(path);

  % Preprocesam matricea pentru a elimina utilizatorii cu prea putine recenzii
  mat=preprocess(mat, min_reviews);

  % Calculam recomandarile folosind SVD
  [U, S, V]=svds(mat, num_features);

  % Calculam recomandarile pe baza similaritatii cosinus
  linked_vec=V(liked_theme, :)';
  num_themes=size(V, 1);
  similarities=zeros(num_themes, 1);
  for i=1:num_themes
    curr_vec=V(i, :)';
    similarities(i)=cosine_similarity(linked_vec, curr_vec);
  endfor

  % Sortam recomandarile si le returnam
  [~, sorted_indices]=sort(similarities, 'descend');

  % Eliminam tema preferata din lista de recomandari
  sorted_indices(sorted_indices==liked_theme)=[];

  % Selectam primele num_recoms recomandari
  recoms=sorted_indices(1:num_recoms);

  % Convertim recomandarile la formatul cerut
  recoms=recoms';
endfunction