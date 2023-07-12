module Quadrant = struct
  type quadrant = A | B | C | D
  let as_str = function
    | A -> "a"
    | B -> "b"
    | C -> "c"
    | D -> "d"
end
