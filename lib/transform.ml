open Tile
open Mosaic
open Instruct

module Transform = struct
  type step_info = 
    ScrollStep of {
      direction : float * float;
      speed : float;
      refill_mode: [`Random | `Underlay | `Filter];
    } |
    ZoomStep of {
      target : float * float;
      speed : float; 
    } |
    MosaicStep of {
      parent_file_path : string;
      existing_lil_imgs : Tile.tile list option;
      prev : Mosaic.mosaic_return option;
    }

  module type Mode = sig
    val step : Tile.arrangement -> step_info -> Tile.arrangement
    val hike : Tile.arrangement -> 
      Instruct.instruction -> 
      Instruct.transition_info option ->
      (Tile.arrangement * Instruct.transition_info option)

  end
end
