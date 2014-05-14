 function [MC] = graph_construct_func(len_graph, high_graph)

count_of_nodes = len_graph * high_graph;

A = zeros(len_graph, high_graph);
% Making Manhatan graph from diagonal matrix

%diagonal matrix

for i = 1:1:count_of_nodes
    for j = 1:1:count_of_nodes
        if i == j
            A(i,j) = 1;
        end
    end
end

%right neighborhood

string_counter = 1;

for i = 1:1:count_of_nodes
    for j = 1:1:count_of_nodes
        if i+1 == j
            A(i,j) = 1;
        end
    
        if ((i  == len_graph * string_counter) && (i+1 == j))
            A(i,j) = 0;
            string_counter = string_counter + 1;
        end
    end
end

%left neighborhood
string_counter = 1;

for i = 1:count_of_nodes
    for j = 1:count_of_nodes
        if (i == j + 1)
            A(i,j) = 1;
        end
        
        if ((i - 1  == len_graph * string_counter) && (i == j + 1))
            A(i,j) = 0;
            string_counter = string_counter + 1;
        end
    end
end

 
%top neighborhood
for i = 1:count_of_nodes
    for j = 1:count_of_nodes
        if ((i + len_graph == j) && (i + len_graph <= count_of_nodes))
            A(i,j) = 1;
        end
    end
end

%bottom neigborhood
for i = 1:count_of_nodes
    for j = 1:count_of_nodes
        if ((i == j + len_graph) && (j + len_graph <= count_of_nodes))
            A(i,j) = 1;
        end
    end
end

    MC = A;
 end
%Graph = biograph(Random_graph_mat);
%Result = view(Graph);

% todo:
% Think about structure for general net.
