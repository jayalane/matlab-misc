function timeAndGraph(f1)
    % Define the range of input sizes to test
    n_values = logspace(1, 6, 20); % 20 points from 10^1 to 10^6
    f2 = f1
    % Preallocate array for execution times
    times = zeros(size(n_values));
    n = 0;
    t = 0;

    % Measure execution time for each input size
    for i = 1:length(n_values)
        nold = n
        n = round(n_values(i));
        told = t
        [s, t] = f1(n);
        times(i) = t;
        if ne(n, 0)
            kest = log(told/t)/log(nold/n)
            aest = t / (n^ kest)
        end
    end
    
    % Plot the results
    plot(n_values, times1, 'o-');
    xlabel('Input size (n)');
    ylabel('Execution time (seconds)');
    title('Algorithm Time Complexity');
    grid on;
end
