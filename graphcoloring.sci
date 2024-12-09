function chromatic_number = graph_coloring(n, graph)
    colors = -ones(1, n);
    chromatic_number = 0;
    
    for u = 1:n
        available = ones(1, n);
        
        for v = 1:n
            if graph(u, v) == 1 & colors(v) ~= -1 then
                available(colors(v)) = 0;
            end
        end
        
        color = 1;
        while available(color) == 0 do
            color = color + 1;
        end
        
        colors(u) = color;
        chromatic_number = max(chromatic_number, color);
    end
endfunction

n = 5;  // Number of subjects
graph = [
    0 1 1 0 0;
    1 0 1 1 0;
    1 1 0 0 1;
    0 1 0 0 1;
    0 0 1 1 0
];

chromatic_number = graph_coloring(n, graph);
disp("Minimum time slots required: " + string(chromatic_number));
