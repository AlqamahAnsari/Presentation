% A list of cities
cities([a, b, c, d]).

% Distances between cities
distance(a, b, 10).
distance(a, c, 15).
distance(a, d, 20).
distance(b, c, 35).
distance(b, d, 25).
distance(c, d, 30).

% We need symmetric distances as facts as well (Assuming a complete graph)
distance(X, Y, D) :- distance(Y, X, D).

% 1. Helper: Calculate the distance of a single path (a list of cities)
path_distance([_], 0). % Base case: distance of a path with 1 city is 0
path_distance([C1, C2 | Rest], D) :-
    distance(C1, C2, D12),
    path_distance([C2 | Rest], D_Rest),
    D is D12 + D_Rest.

% 2. Helper: Find the path with the minimum distance from a list of paths
find_min_distance([Path|Paths], MinDistance, ShortestPath) :-
    path_distance(Path, Dist),
    find_min_distance_helper(Paths, Dist, Path, MinDistance, ShortestPath).

find_min_distance_helper([], MinD, ShortestP, MinD, ShortestP).
find_min_distance_helper([Path|Paths], CurrentMinD, CurrentShortestP, MinDistance, ShortestPath) :-
    path_distance(Path, Dist),
    (
        Dist < CurrentMinD -> % If current path is shorter
            NewMinD = Dist,
            NewShortestP = Path
        ; % Otherwise, keep the current shortest
            NewMinD = CurrentMinD,
            NewShortestP = CurrentShortestP
    ),
    find_min_distance_helper(Paths, NewMinD, NewShortestP, MinDistance, ShortestPath).

% Find the shortest path (main predicate)
tsp(Cities, ShortestPath, MinDistance) :-
    % `findall` finds all possible permutations of the cities.
    findall(Path, (permutation(Cities, Path)), AllPaths),
    % Find the distance for each path and then find the minimum.
    find_min_distance(AllPaths, MinDistance, ShortestPath).
