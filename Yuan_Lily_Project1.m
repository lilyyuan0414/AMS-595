% set seed
rng(123)

%% Task 1

%true pi
true_pi = pi;

point = [10, 100, 1000, 10000, 100000];

pi_estimate = zeros(1,length(point));
std_estimate = zeros(1,length(point));
exc_time = zeros(1,length(point));

for i = 1:length(point)
    
    %timer
    tic;

    %number of points
    N = point(i);

    %points inside of the circle
    sum_inside = 0;
    
    %for each point case
    for k = 1:N
        
        %generate a number between 0 to 1
        x = rand;
        y = rand;

        %check if the point is inside of the circle
        if x^2 + y^2 <= 1
            sum_inside = sum_inside + 1; % count of points inside the circle
        end
    end
    
    pi_estimate(i) = 4 * sum_inside / N; % Estimate pi for the current number of points

    std_estimate(i) = pi_estimate(i) - true_pi; % Calculate the standard deviation

    exc_time(i) = toc;

    % display results for this case
    fprintf('N = %6d  pi_est = %.6f  error = %.6f  time = %.4f sec\n', ...
        N, pi_estimate(i), std_estimate(i), exc_time(i));

end

% ===================== PLOTS =====================


% Plot 1: estimated pi vs N
figure;
plot(point, pi_estimate, 'o-');
xlabel('Number of points (N)');
ylabel('Estimated \pi');
title('Estimated \pi vs N');

% Plot 2: error vs N
figure;
plot(point, std_estimate, 'o-');
xlabel('Number of points (N)');
ylabel('Error (\pi_{est} - \pi)');
title('Error vs N');

% Plot 3: execution time vs N
figure;
plot(point, exc_time, 'o-');
xlabel('Number of points (N)');
ylabel('Execution time (seconds)');
title('Execution time vs N');





%% Task 2

%starting from 10^-2....
precision_level = [2, 3, 4, 5];

% loop through the prevision levels
for i = 1:length(precision_level)

    N = precision_level(i);
    
    %starting from 10^-2...
    tolerance = 10.^(-N);

    % use Leibniz series to find the pi estimate
    pi_estimate = 0;
    n = 0; % number of iterations
    series_term = 1;   % first term = 1/(2*0+1)

    % while loop until tolerance condition is met
    while abs(4*series_term) > tolerance
        pi_estimate = pi_estimate + 4*series_term;     % add current term
        n = n + 1;
        series_term = ((-1)^n) / (2*n + 1);            % update series term
    end

    % report result
    fprintf('precision level = %d sig figs: estimated pi ≈ %.10f after %d iterations (tolerance = %.6g)\n', ...
        N, pi_estimate, n, tolerance);
end



%% Task 3

clear; clc;

pi_estimate = pi_estimate_precision(4);

% display result
disp(pi_estimate);

function pi_estimate = pi_estimate_precision(precision_level)
    % tolerance level
    tolerance = 10^(-precision_level);

    % set up the figure and full circle
    figure;
    hold on;
    axis square;
    axis([-1 1 -1 1]);
    theta = linspace(0, 2*pi, 400);
    plot(cos(theta), sin(theta), 'k-');  % draw full circle

    % set up
    N = 0;                 % number of iterations
    inside = 0;            % points inside the circle
    pi_estimate = 0;
    previous_pi = Inf;

    % repeat until tolerance is met
    while (N < 200) || (abs(pi_estimate - previous_pi) > tolerance)
        previous_pi = pi_estimate;

        % one random point in [-1,1] x [-1,1]
        x = 2*rand - 1;
        y = 2*rand - 1;

        % test if inside
        if x^2 + y^2 <= 1
            inside = inside + 1;
            plot(x, y, 'b.', 'MarkerSize', 8);  % inside = blue
        else
            plot(x, y, 'r.', 'MarkerSize', 8);  % outside = red
        end

        % update count and estimate
        N = N + 1;
        pi_estimate = 4 * (inside / N);        % area ratio * 4
    end

    % print final result in command window
    fprintf('Number of iterations=%d, pi_estimate=%.10f\n', N, pi_estimate);

    % show final result on plot
    text(-0.95, 0.95, sprintf('\\pi ≈ %.10f', pi_estimate), ...
         'Units','data', 'FontSize', 16, 'FontWeight','bold');
end

%%
% Some code and explanations were developed with assistance
% from ChatGPT (OpenAI, 2025). 
% Reference: OpenAI. (2025). ChatGPT (Mar 2025 version) 
% [Large language model]. https://chat.openai.com/




