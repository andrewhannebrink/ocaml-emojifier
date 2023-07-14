open Tile 
open Mosaic
open Imagemagickcmds

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
    let n = lil_imgs |> List.length |> float_of_int in 
    let vx = Imagemagickcmds.resolution |> fst |> float_of_int in
    let vy = Imagemagickcmds.resolution |> snd |> float_of_int in
    let px = (n *. vx /. vy) |> sqrt |> ceil in
    let py = (n *. vy /. vx) |> sqrt |> ceil in
    let sx = if (px *. vy /. vx) *. px < n then
      (vy /. (px *. vy /. vx)) |> ceil else
      (vx /. px) |> ceil in
    let sy = if (py *. vx /. vy) *. py < n then
      (vx /. (py *. vx /. vy)) |> ceil else
      (vy /. py) |> ceil in 
    let i = ref 0 in 
    let op_arrangement = ref [] in
    let _ = (List.init (int_of_float px) (fun x -> x))
    |> List.map (fun x -> (
      List.init (int_of_float py) (fun y -> y)
      |> List.map (fun y -> 
        (string_of_int x ^ " | " ^
          string_of_int y ^ " | " ^
          string_of_float sx ^ " | " ^
          string_of_float sy)
        |> print_endline;
        let tile = Tile.make_tile 
            (Some ("io/lil_imgs/emoji_buffered/" ^ (List.nth lil_imgs !i)))
            (float_of_int x *. sx)
            (float_of_int y *. sx)
            sx in 
        op_arrangement := tile :: !op_arrangement;
      )
    )) in
    !op_arrangement
    (*
    List.map (fun lil_img ->
      print_endline lil_img;
        Tile.make_tile (Some ("io/lil_imgs/emoji_buffered/" ^ lil_img))
            200. 200. 64.
      ) lil_imgs
      *)
  )
end
