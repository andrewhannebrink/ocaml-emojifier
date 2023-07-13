open Tile
open Mosaic

module Transform = struct
  type step_info = 
    ScrollStep of {
      direction : float * float;
      speed : float;
      refill_mode: [`Random | `Underlay];
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
  end
end
