open Quadrant
open Tile

module Mosaic = struct 
  type mosaic_return = {
    prev_parent_quadrant: Quadrant.quadrant;
    prev_target_quadrant: Quadrant.quadrant;
    prev_parent_tiles: Tile.arrangement;
    prev_target_tiles: Tile.arrangement;
    depth: float;
  }
  let get_lil_imgs_from_dir dir_name =
    print_endline "Loading lil images...";
    Sys.readdir ("io/lil_imgs/" ^ dir_name)
      |> Array.to_list
end
