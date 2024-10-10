% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

%This value represents the size of the puzzle (n x n)
#const n = 4.

%This value represents the square root of the size (for subgrid)
#const m = 2.

value(1..n).
%Accomplished: gives atom for 1..4 in choice rules

sudoku(X,Y,Z) :- initial(X,Y,Z).
%Accomplished: "import" initials into our solutions

{sudoku(X,Y,Z) : value(Z)} = 1 :- X= 1..n, Y= 1..n.
%Accomplished: Generates sudoku cells

{subgrid(X,Y,G) : value(X) , value(Y)} = 1 :- X = 1..n, Y = 1..n, G = 1+(((X-1)/m)*m+(Y-1)/m), G = 1..n.
%Accomplished: Generates subgrids of puzzle

:- sudoku(X1, Y, Z), sudoku(X2, Y, Z), X1 != X2.
:- sudoku(X, Y1, Z), sudoku(X, Y2, Z), Y1 != Y2.
%Accomplished: Ensure that each row and column has a distinct value

#show sudoku/3.
#show subgrid/3.