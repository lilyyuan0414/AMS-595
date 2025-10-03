%% Project 2 main — boundary -> degree-15 fit -> arc length
% Needs: fractal.m, bisection.m, poly_len.m
clear; clc; close all;

%% 1) Sample boundary points across x ∈ [-2, 1]
Nx   = 1500;                      % total x samples (gives >1000 valid points)
xall = linspace(-2, 1, Nx);
yall = nan(size(xall));

indAtX = @(x) @(y) (fractal(complex(x, y)) > 0)*2 - 1;   % +1 outside, -1 inside

% bracketing parameters
yLow0 = 0.0;                      % lower guess (inside)
yUp0  = 1.8;                      % upper guess (outside)
dy    = 0.03;                     % step to nudge guesses
yMin  = -2.5;                     % search limits
yMax  =  3.0;

for i = 1:Nx
    x = xall(i);
    f = indAtX(x);

    % find inside lower bound
    yL = yLow0; vL = f(yL);
    while vL ~= -1 && (yL - dy) >= yMin
        yL = yL - dy; vL = f(yL);
    end

    % find outside upper bound
    yU = yUp0;  vU = f(yU);
    while vU ~= +1 && (yU + dy) <= yMax
        yU = yU + dy; vU = f(yU);
    end

    if vL == -1 && vU == +1
        assert(f(yL) == -1 && f(yU) == +1, 'Bad bracket at x=%.3f', x);
        yall(i) = bisection(f, yL, yU);
    end
end

keep = ~isnan(yall);
xb = xall(keep);
yb = yall(keep);
fprintf('Collected %d boundary points out of %d x-values.\n', numel(xb), Nx);

figure('Name','Boundary');
scatter(xb, yb, 5, 'filled'); grid on;
xlabel('x'); ylabel('y'); title(sprintf('Boundary points (N=%d)', Nx));

%% 2) Choose fit window [xs, xe] and clean data
[xb, order] = sort(xb); yb = yb(order);
[ux, ia]    = unique(xb, 'stable'); xb = ux; yb = yb(ia);

xs = -1.20;                   
xe =  0.40;
assert(xs < xe, 'xs must be < xe');
sel = (xb >= xs) & (xb <= xe);
xf_data = xb(sel);
yf_data = yb(sel);

deg = 15;
assert(numel(xf_data) >= deg + 1, 'Need at least %d points in [%.3f, %.3f].', deg+1, xs, xe);

%% 3) Degree-15 polynomial fit
p  = polyfit(xf_data, yf_data, deg);
xf = linspace(xs, xe, 2000);           % evaluate only inside the window
yf = polyval(p, xf);

figure('Name','Fit (deg 15)');
plot(xf_data, yf_data, '.', 'MarkerSize', 8, 'DisplayName','data'); hold on;
plot(xf, yf, 'LineWidth', 1.5, 'DisplayName','deg-15 fit');
grid on; xlabel('x'); ylabel('y');
title(sprintf('Fit on [%.3f, %.3f], degree %d', xs, xe, deg));
legend('Location','best');

% residuals
r = yf_data - polyval(p, xf_data);
figure('Name','Residuals');
plot(xf_data, r, '.', 'MarkerSize', 8); grid on;
xlabel('x'); ylabel('residual'); title('Residuals vs x');

%% 4) Arc length over [xs, xe]
l = poly_len(p, xs, xe);
fprintf('Arc length on [%.4f, %.4f] (deg %d): %.9f\n', xs, xe, deg, l);

% optional: polyline check
dl = sum(hypot(diff(xf_data), diff(yf_data)));
fprintf('Polyline length (data):                   %.9f\n', dl);
