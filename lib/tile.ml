module Tile = struct
  type color = int * int * int
  type coords = {
    real: (float * float) option;
    pixel: int * int
  }
  type tile = {
    file_path: string option;
    coords: coords list;
    parent_coords: coords option; (* only used during transpose *)
    avg_color: color option;
  }
  type arrangement = tile list
end
