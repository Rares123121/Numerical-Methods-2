function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);

  mat2 = preprocess(mat, min_reviews);

  [U, S, V] = svds(mat2, num_features);
  # de facut sortarea cumva
  indici = zeros(1, rows(V));
  similar = zeros(1, rows(V));

  for i = 1:rows(V)
    indici(i) = i;
    similar(i) = cosine_similarity(V(i, :), V(liked_theme, :));
  endfor

  similar(liked_theme) = 0.00001;

  for i = 1:rows(V) - 1
    for j = i + 1:rows(V)
      if similar(i) < similar(j)
        aux = similar(i);
        similar(i) = similar(j);
        similar(j) = aux;
        aux = indici(i);
        indici(i) = indici(j);
        indici(j) = aux;
      endif
    endfor
  endfor

  recoms = indici(1:num_recoms);
end
