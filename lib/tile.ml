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
    depth: float;
  }
  type arrangement = tile list
  let make_tile lil_img x y depth =
    let coords = [
      {
        real = Some (x, y); 
        pixel = (int_of_float x, int_of_float y)
      }
    ] in
    let avg_color = None in
    let file_path = lil_img in
    {file_path; coords; avg_color; depth; parent_coords = None}
end
