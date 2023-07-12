open Tile 
module Mock = struct
  let sample_arrangement: Tile.arrangement = [
    {
      file_path = Some "assets/emoji1.png";
      coords = [
        {
          real = Some (0., 0.);
          pixel = (0, 0)
        }
      ];
      parent_coords = None;
      avg_color = None
    }
  ] 
end
