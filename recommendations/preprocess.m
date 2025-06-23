function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.

  % Calculam cate recenzii are fiecare utilizator
  rows_with_reviews=sum(mat>0, 2)>=min_reviews;

  % Pastram doar utilizatorii care au cel putin `min_reviews` recenzii
  reduced_mat=mat(rows_with_reviews, :);
endfunction
