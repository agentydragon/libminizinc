include "arg_max_int.mzn";
include "arg_max_bool.mzn";
include "arg_max_float.mzn";

/** @group globals
    Returns the index of the maximum value in the array \a x.
    When breaking ties the least index is returned.
*/
function var $$E: arg_max(array[$$E] of var int: x)  = 
                  let { constraint length(x) > 0; } in arg_max_total(x);

/** @group globals
    Returns the index of the maximum value in the array \a x.
    When breaking ties the least index is returned.
*/
function var $$E: arg_max(array[$$E] of var bool: x)  = 
                  let { constraint length(x) > 0; } in arg_max_total(x);

/** @group globals
    Returns the index of the maximum value in the array \a x.
    When breaking ties the least index is returned.
*/
function var $$E: arg_max(array[$$E] of var float: x)  = 
                  let { constraint length(x) > 0; } in arg_max_total(x);

function var $$E: arg_max_total(array[$$E] of var int: x) :: promise_total = 
                  if length(x) = 0 then 0 else
                  let { var min(index_set(x)) .. max(index_set(x)): i;
                        constraint maximum_arg_int(x, i); }
                  in i endif;
function var $$E: arg_max_total(array[$$E] of var bool: x) :: promise_total = 
                  if length(x) = 0 then 0 else
                  let { var min(index_set(x)) .. max(index_set(x)): i;
                        constraint maximum_arg_bool(x, i); }
                  in i endif;
function var $$E: arg_max_total(array[$$E] of var float: x) :: promise_total = 
                  if length(x) = 0 then 0 else
                  let { var min(index_set(x)) .. max(index_set(x)): i;
                        constraint maximum_arg_float(x, i); }
                  in i endif;

/** @group globals
    Constrain \a i to be the index of the maximum value in the array \a x.
    When breaking ties the least index is returned.
    
    Assumption: |\a x| > 0
*/
predicate maximum_arg(array[int] of var int: x, var int: i) =
          maximum_arg_int(x, i);

/** @group globals
    Constrain \a i to be the index of the maximum value in the array \a x.
    When breaking ties the least index is returned.
    
    Assumption: |\a x| > 0
*/
predicate maximum_arg(array[int] of var bool: x, var int: i) =
          maximum_arg_bool(x, i);

/** @group globals
    Constrain \a i to be the index of the maximum value in the array \a x.
    When breaking ties the least index is returned.
    
    Assumption: |\a x| > 0
*/
predicate maximum_arg(array[int] of var float: x, var int: i) =
          maximum_arg_float(x, i);
