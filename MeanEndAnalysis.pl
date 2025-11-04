% Problem Definition
initial_state(location(a)).
goal_state(location(b)).

% Define operators (actions)
move(location(X), location(Y)) :-
    connection(X, Y).

% Define connections in the world
connection(a, c).
connection(c, b).

% --- Missing Predicate Definitions ---

% 1. diff(Current, Goal, Difference)
diff(location(CurrentLoc), location(GoalLoc), location_mismatch) :-
    CurrentLoc \= GoalLoc.

% 2. appropriate_operator(Difference, Operator)
% The 'move' operator resolves the location mismatch.
appropriate_operator(location_mismatch, move(location(X), location(Y))).

% 3. apply(Operator, Current, Next)
apply(move(location(X), location(Y)), location(X), location(Y)) :-
    connection(X, Y).

% --- Means-End Analysis loop (as provided) ---
solve(State, State, []). % Base case: goal is reached.
solve(Current, Goal, [Operator|Rest]) :-
    % Check for differences
    diff(Current, Goal, Difference),
    % Select an operator to reduce the difference
    appropriate_operator(Difference, Operator),
    % Apply the operator to get the next state
    apply(Operator, Current, Next),
    % Recursively solve from the new state
    solve(Next, Goal, Rest).
