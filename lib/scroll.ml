open Tile
open Transform

module Scroll : Transform.Mode = struct
  let step (arrangement : Tile.arrangement) = function
    | Transform.ScrollStep { direction = _; speed } -> 
        print_endline (string_of_float speed); arrangement
    | _ -> arrangement
end
