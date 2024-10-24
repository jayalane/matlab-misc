function timeAndGraph(f1, f2)
    % Define the range of input sizes to test
    n_values = logspace(1, 4, 20); % 20 points from 10^1 to 10^4
    
    % Preallocate array for execution times
    times1 = zeros(size(n_values));
    times2 = zeros(size(n_values));
    
    % Measure execution time for each input size
    for i = 1:length(n_values)
        n = round(n_values(i));
        [A, x, u] = InitMatrices(n);
        t1 = timeit(@() feval(f1, A, x, u));
        times1(i) = t1;
        t2 = timeit(@() feval(f2, A, x, u));
        times2(i) = t2;
        n
        t1
        t2
    end
    
    % Plot the results
    plot(n_values, times1, 'o-');
    plot(n_values, times2, 'o-');
    xlabel('Input size (n)');
    ylabel('Execution time (seconds)');
    title('Algorithm Time Complexity');
    grid on;
end
