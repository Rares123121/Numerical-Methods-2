function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn
    #x = zeros(n + 1, 1);
    #y = zeros(n + 1, 1);

    % TODO 1: Open the file for reading
     fisier = fopen(filename, 'r');
    % TODO 2: Read n, x, y from the file
     n = fscanf(fisier, '%d', 1);
     x1 = fscanf(fisier, '%d', [1, n + 1]);
     y1 = fscanf(fisier, '%d', [1, n + 1]);

     x = x1';
     y = y1';
    % TODO 3: Close the file
    fclose(fisier);
end
