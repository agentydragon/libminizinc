include "fzn_range.mzn";
include "fzn_range_reif.mzn";

/** @group globals
  Requires that the image of function \a x (represented as an array) on set
  of values \a s is \a t.  ub(\a s) must be a subset of index_set(\a x) otherwise an
  assertion failure will occur.
*/
predicate range(array[int] of var int: x, var set of int: s,
                                          var set of int: t) =
    assert(ub(s) subset index_set(x),
        "range: upper bound of 's' must be a subset of the index set of 'x'",
        fzn_range(x, s, t)
    );
