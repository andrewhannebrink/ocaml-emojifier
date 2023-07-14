module Quadrant = struct
  type quadrant = A | B | C | D
  let str_of_q = function
    | A -> "a"
    | B -> "b"
    | C -> "c"
    | D -> "d"
end
