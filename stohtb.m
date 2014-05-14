clc; clear;

%% Initial parameters
%Net generation parameters
len = 10;
high = 10;
save_flag = 0;
load_flag = 1;
path_to_file = '/Users/Egor/Desktop/Alpha/g10x10.mat';

%% Generate manhattan net
%net - information about time on each arc. (origin, destination, time, flow)
[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);
pairs = making_pairs_func(len*high);

%% method part

num_iter = 20;
L = 30;
e = 0.1;
mu = 0.1;
d = zeros(size(pairs,1),1);
d(99) = 10;

tic
[t, F] = PGM(num_iter, L, mu, d, e, net, mc, pairs)
toc

t - net(:,3)
%% Output part
%graph(mc, net, net(:,4), len, high)




