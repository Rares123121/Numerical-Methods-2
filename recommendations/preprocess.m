function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  nr_linii = 1;
  reduced_mat = [];
  for i = 1:rows(mat)
    cnt = 0;
    for j = 1:columns(mat)
      if mat(i, j) != 0
        cnt = cnt + 1;
      endif
    endfor
    if cnt >= min_reviews
      reduced_mat(nr_linii, :) = mat(i, :);
      nr_linii = nr_linii + 1;
    endif
  endfor
end
