function it = fractal(c)
    % FRACTAL  Check if a complex number c is inside the Mandelbrot set.
    % Returns the number of iterations until escape, or 0 if it never escapes.
    
    maxIter = 100;   % maximum number of iterations to try
    z = 0;           % start value of z
    it = 0;          % counter for number of iterations
    
    % keep updating z = z^2 + c until it escapes or we reach maxIter
    while it < maxIter && abs(z) <= 2
        z = z*z + c;   % Mandelbrot update rule
        it = it + 1;   % count this step
    end
    
    % if z never escaped (still inside after maxIter), return 0
    if abs(z) <= 2
        it = 0;
    end
end
