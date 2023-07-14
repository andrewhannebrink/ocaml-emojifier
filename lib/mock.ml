open Tile 
open Mosaic

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
      avg_color = None;
      depth = 80.;
    }
  ]
  let unit_arrangement: Tile.arrangement = (
    let lil_imgs = Mosaic.get_lil_imgs_from_dir "emoji_buffered" in
    List.map (fun lil_img ->
      print_endline lil_img;
        Tile.make_tile (Some lil_img) 200. 200. 64.
      ) lil_imgs
  )
end
