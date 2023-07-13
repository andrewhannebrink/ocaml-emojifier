open Tile
open Transform

module Scroll : Transform.Mode = struct
  let step (arrangement : Tile.arrangement) = function
    | Transform.ScrollStep { direction = _; speed; refill_mode} -> (
        print_endline (string_of_float speed);
        let _ = match refill_mode with
          | `Random -> print_endline "random";
          | `Underlay -> print_endline "underlay" in 
        arrangement)
    | _ -> arrangement
end
