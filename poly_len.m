function l = poly_len(p, s, e)
% POLY_LEN  Compute arc length of a polynomial curve y(x) from x = s to x = e.
%   p : coefficients from polyfit (highest power first)
%   s : start x value
%   e : end x value
%   l : arc length between s and e

    % take derivative of the polynomial
    dp = polyder(p);

    % arc length formula uses sqrt(1 + (y')^2)
    f = @(x) sqrt(1 + (polyval(dp, x)).^2);

    % integrate f from s to e to get arc length
    l = integral(f, s, e);
end
