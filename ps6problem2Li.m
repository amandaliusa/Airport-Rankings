%{
This file contains the adjacency matrix A for the network
of (anonymized) US airports: nodes represent airports and links represent 
air travel connections among them. That is, airports i and j are connected 
(Aij = 1) if there are direct flights between them. The network in 
USAirTransportation.mat is obtained by considering the 500 US airports with 
the largest amount of traffic from publicly available data. Implement the 
PageRank algorithm (see lecture 13) for ranking the airports. Use your 
function ps6problem1Lastname.m from Problem 1 for finding the importance 
score vector. What are the ID numbers of 10 most important airports for 
alpha = 0.1, 0.15, 0.20? 
%}
clc; clear;
data = load('USAirTransportation.mat');
L = zeros(500); % preallocate link matrix

for i=1:500
    % generate link matrix
    L(:,i) = data.A(:,i) / sum(data.A(:,i)); 
end

S = ones(500, 500) / 500;
alpha = [0.1, 0.15, 0.20];

for k=1:3
    L_tilde = (1 - alpha(k)) * L + alpha(k) * S;
    [l, x] = ps6problem1Li(L_tilde); % find importance score vector
    [B, I] = maxk(x, 10);            % find 10 most important airports 
   fprintf("The ID numbers of the 10 most important airports for "...
        + "alpha = %d are %d, %d, %d, %d, %d, %d, %d, %d, %d, %d.\n", ...
        alpha(k), I(1), I(2), I(3), I(4), I(5), I(6), I(7), I(8), ...
        I(9), I(10));
end
% The ID numbers of the 10 most important airports for
% alpha = 0.10: 6, 1, 7, 3, 2, 21, 11, 8, 18, 10.
% alpha = 0.15: 6, 7, 3, 1, 2, 21, 11, 8, 10, 18.
% alpha = 0.20: 6, 7, 3, 1, 2, 21, 11, 10, 8, 18.
