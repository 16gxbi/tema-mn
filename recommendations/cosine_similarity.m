function similarity = cosine_similarity(A, B)
  norm_A=norm(A);
  norm_B=norm(B);
  if norm_A==0 || norm_B==0
    error('One of the vectors is zero, cannot compute cosine similarity.');
  endif

  % Calculam produsul scalar dintre A si B
  dot_product=dot(A, B);

  % Calculam similaritatea cosinus
  similarity=dot_product/(norm_A*norm_B);
endfunction
