open Tile
open Transform
open Instruct

module Scroll : Transform.Mode = struct
  let step (arrangement : Tile.arrangement) = function
    | Transform.ScrollStep { direction = _; speed; refill_mode} -> (
        print_endline (string_of_float speed);
        let _ = match refill_mode with
          | `Random -> print_endline "random"
          | _ -> failwith "unimplemented" in
        arrangement
      )
    | _ -> arrangement

  let hike (last_arrangement : Tile.arrangement) 
      (instruction : Instruct.instruction) 
      (transition_info : Instruct.transition_info option) = 
    (*TODO loop through total frames here calling step() each time, writing to db along the way *)
    let _ = (last_arrangement, instruction, transition_info) in
    (last_arrangement, None)
      
end
