open Tile
open Quadrant

module Instruct = struct
  let gcf_depths = [12, 24, 30, 40, 60, 120]
  type hike_info = 
    Scroll of {
      start_velocity : float;
      end_velocity : float;
      direction : float * float;
      (* TODO This is a bad pattern because when these types change they must also be 
       updated in transform.ml*)
      refill_mode : [`Random | `Underlay | `Filter];
    } |
    Zoom of { todo: unit }

  type transition_info = 
    (
      Quadrant.quadrant 
      * Tile.arrangement 
      * hike_info
      (* Underlay.underlay TODO *)
    ) list

  type instruction = {
    total_frames : int;
    hike_info : hike_info;
    jump : Quadrant.quadrant option;
  }

end
