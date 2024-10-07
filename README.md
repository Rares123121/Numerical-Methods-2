Task 1: Numerical Music
    Function stereo_to_mono:

        I iterate through the stereo matrix and sum each row. I then divide
        each sum by the number of rows in the matrix and place the result at 
        position i in the vector.

    Function spectrogram:

        In the first loop, I store the start and stop positions of the 
        sequence I want to extract in the 'window' variable. I apply 
        the Hann window to this sequence, then apply the Fourier transform.
        The desired result is the vector from 1 to window_size.
        The second loop is used to calculate the frequency vector. 
        To start at 0, I compute it based on i - 1.
        The third loop is for the time vector. Similarly, I start from i - 1.

    Function oscillator:

        I create the sine wave using the provided formula, and the time vector
        is a linear ramp from 0 to the duration, scaled by fs * duration.
        I calculate the number of samples for each envelope component.
        I generate each envelope using linear ramps, then combine them 
        into one large envelope.
        To get the desired result, I multiply the sine wave with the
        envelope, and then transpose this vector.

    Function low_pass:

        I calculate the Fourier transform of the signal and compute 
        the frequency vector.
        Then, I construct a mask by checking whether the current 
        frequency is smaller or larger than the cutoff_freq.
        I multiply the Fourier transform of the signal by the mask and 
        apply the inverse Fourier transform to the result. I normalize 
        the output, which becomes the final answer.

    Function apply_reverb:

        I convert the impulse_response to mono. I then compute the convolution
        between the signal and the mono impulse_response. I normalize 
        this convolution, which is the final result.

Task 2: Robots
    Function parse_data:

        I open the file with read permissions, then read n, the x vector, 
        and the y vector.
        To get the required result, I transpose these vectors.
        At the end, I close the file.

    Function spline_c2:

        I compute the number of intervals and initialize the matrix and 
        solution vector with zeros.
        For the first n equations, I set the value of 1 for the a_i 
        values and the y(i) value in the solution vector.
        For the n + 1 equation, I set the coefficients in the matrix 
        using the polynomial formula.
        For the 3(n - 1) equations, I place 8 values, which are the 
        results of solving the given equations. Since two polynomials
        are always involved, I will always have 8 values to place, with 
        the rest of the row remaining zeros.
        For the last two equations, I place 4 values, as only one polynomial 
        is involved each time.
        The values for the 3(n - 1) equations and the last two are mostly the 
        same, the difference being the differences between x(i+1) and x(i).
        In the end, I solve the system.

    Function P_spline:

        To find the correct index for the interval where x_interp(i) is 
        located, I use a binary search algorithm for efficiency.
        After finding the index, I extract the coefficients from the 
        coefficient vector.
        Finally, y_interpolated is the value of the polynomial with 
        the extracted coefficients at the points x_interpolated(i) - x(i).

    Function Vandermonde:

        I fill the first column of the matrix with 1s, and for the other 
        positions, I set x(i) raised to the power of column_index - 1.
        At the end, I solve the system.

    Function P_Vandermonde:

        I calculate the value of the polynomial at the x_interpolated(i) 
        points, and each result is placed in the y_interp vector.

Task 3: Recommendations
    Function Preprocess:

        I count how many non-zero values are in each row of the matrix. If the 
        count is greater than or equal to the minimum number 
        of elements that must be non-zero, I add the row to a new matrix.

    Function cosine_similarity:

        I apply the formula.

    Function Recommendations:

        I read the matrix from a file, then preprocess it.
        I apply the SVD decomposition.
        I build the index and similarity vectors.
        indices(i) = i.
        For each position in the similarity vector, I calculate the similarity
        between the i-th vector in the matrix and the liked_theme vector 
        from the matrix using the cosine_similarity function.
        I set the value at liked_theme to a very small number, because 
        when calling the cosine_similarity function, if i equals liked_theme, 
        the result will be 1, and it will always be the first, which is not desired.
        I then sort the two vectors in descending order to have the indices 
        of the largest elements at the beginning.
        For the result, I extract the first num_recoms elements.