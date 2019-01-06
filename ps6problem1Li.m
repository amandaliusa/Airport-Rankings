function [l1, v1] = ps6problem1Li(A)
%{
Let A be an n × n matrix, with eigenvalues lambda1, . . . , lambdan such 
that |lambda1| > |lambda2| > . . . > |lambdan|. The eigenvalue lambda1 is 
called the dominant eigenvalue, and the corresponding eigenvector v1 is 
called the dominant eigenvector. Write a Matlab function that takes A as an 
argument and uses the power method (lecture 13) to compute lambda1 and v1.
%}
    n = size(A);
    x = rand(n(1), 1); % initialize power method

    while true
        xprev = x; % store previous iteration 
    
        x = A * xprev / norm(A * xprev, inf); % update vector
    
        if (norm(x - xprev, inf) < 0.000000001) % algorithm has converged
            break
        end
    end

    v1 = x; % x converges to the dominant eigenvector
    Av = A * v1;
    l1 = Av(1) / v1(1); % find corresponding eigenvalue
end