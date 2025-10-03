function m = bisection(fn_f, s, e)
% BISECTION  Find the boundary point between inside (-1) and outside (+1).
%   m = BISECTION(fn_f, s, e)
%   fn_f : function of y, returns -1 inside and +1 outside
%   s    : starting lower bound (should be inside)
%   e    : starting upper bound (should be outside)
%   m    : the y value where the switch happens

    tol   = 1e-6;   % how close we want to be
    maxIt = 60;     % safety cap on iterations

    fs = fn_f(s);   % value at lower bound
    fe = fn_f(e);   % value at upper bound

    % check that we really start inside and outside
    if ~(fs == -1 && fe == +1)
        error('Need fn_f(s) = -1 and fn_f(e) = +1 to start.');
    end

    a = s; b = e;   % set the initial interval
    for k = 1:maxIt
        m  = 0.5*(a + b);   % midpoint
        fm = fn_f(m);

        % stop if we are close enough or exact
        if fm == 0 || abs(b - a) <= 2*tol
            return
        end

        % decide which half to keep
        if fm == +1
            b = m;   % midpoint is outside
        else
            a = m;   % midpoint is inside
        end
    end

    % if we hit the max steps, just return the midpoint
    m = 0.5*(a + b);
end
