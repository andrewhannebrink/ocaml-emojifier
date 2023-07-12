open Quadrant
open Tile

module Mosaic = struct 
  type mosaic_return = {
    prev_parent_quadrant: Quadrant.quadrant;
    prev_target_quadrant: Quadrant.quadrant;
    prev_parent_tiles: Tile.arrangement;
    prev_target_tiles: Tile.arrangement;
    depth: int
  }
end
