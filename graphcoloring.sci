function [coloring, numColors] = greedyColoring(graph, numSubjects)
    coloring = -1 * ones(1, numSubjects);  
        coloring(1) = 0;  
    available = zeros(1, numSubjects);
    for u = 2:numSubjects
        available = zeros(1, numSubjects)
        for v = 1:numSubjects
            if graph(u, v) == 1 & coloring(v) ~= -1 then
                available(coloring(v) + 1) = 1;  // Mark the color of adjacent vertex as unavailable
            end
        end
        for c = 0:numSubjects-1
            if available(c + 1) == 0 then
                coloring(u) = c;  // Assign the color to vertex u
                break;
            end
        end
    end
    
    numColors = max(coloring) + 1;
end

function examSchedule(graph, numSubjects)
    [coloring, numColors] = greedyColoring(graph, numSubjects);
    
    disp("Minimum Time Slots (Chromatic Number): " + string(numColors));
    disp("Assigned Time Slots to Subjects:");
    for i = 1:numSubjects
        disp("Subject " + string(i) + " is assigned to time slot " + string(coloring(i) + 1));
    end
end

clc;
disp("Exam Scheduling Using Graph Coloring");

numSubjects = input("Enter the number of subjects: ");
disp("Enter the adjacency matrix (1 if there's a common student, 0 otherwise):");
graph = zeros(numSubjects, numSubjects);  

for i = 1:numSubjects
    for j = 1:numSubjects
        if i != j then
            graph(i, j) = input("Is there a common student between subject " + string(i) + " and subject " + string(j) + "? (1 for Yes, 0 for No): ");
        else
            graph(i, j) = 0;  
        end
    end
end

examSchedule(graph, numSubjects);