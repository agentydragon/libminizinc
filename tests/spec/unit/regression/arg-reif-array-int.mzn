/***
!Test
solvers: [gecode, chuffed]
expected: !Result
  solution: !SolutionSet
  - !Solution
    a: 1
  - !Solution
    a: 2
  - !Solution
    a: 3
options:
  all_solutions: true
***/

var 1..3: a;

predicate test_pred(array[int] of 1..10: x, var int: y) = y = 3;

constraint test_pred([1, 2, 4, 11], a) == false;

solve satisfy;

output ["a = ", show(a), ";\n"];
