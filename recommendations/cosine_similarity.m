function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  A = A / max(abs(A));
  B = B / max(abs(B));

  similarity = dot(A, B) / (norm(A) * norm(B));
end
