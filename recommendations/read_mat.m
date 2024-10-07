function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  rezultat = csvread(path, 1, 0);
  mat = rezultat(:, 2:end);
end
