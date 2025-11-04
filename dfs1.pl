% Example of a simple graph represented by facts.
path(a, b).
path(a, c).
path(b, d).
path(b, e).
path(d, h).
path(d, i).
path(e, j).
path(e, k).
path(c, f).
path(c, g).

% DFS rule:
dfs(Start, Goal, Path) :-
    % The `dfs_util` predicate does the actual work.
    % The third argument is the list of visited nodes to avoid cycles.
    dfs_util(Start, Goal, [Start], Path).

dfs_util(Goal, Goal, Visited, Visited). % Base case: We've reached the goal.
dfs_util(Current, Goal, Visited, Path) :-
    % `path(Current, Next)` finds a neighbor of the current node.
    path(Current, Next),
    % `\+ member(Next, Visited)` checks if the neighbor hasn't been visited yet.
    \+ member(Next, Visited),
    % Recursively call `dfs_util` for the neighbor.
    dfs_util(Next, Goal, [Next|Visited], Path).
