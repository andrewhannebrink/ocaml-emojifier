open Tile 
module Mock = struct
  let sample_arrangement: Tile.arrangement = [
    {
      file_path = Some "io/lil_imgs/emoji_buffered/1f34d.png";
      coords = [
        {
          real = Some (0., 0.);
          pixel = (0, 0)
        };
        {
          real = Some (80., 80.);
          pixel = (80, 80)
        }
      ];
      parent_coords = None;
      avg_color = None
    }
  ] 
end
