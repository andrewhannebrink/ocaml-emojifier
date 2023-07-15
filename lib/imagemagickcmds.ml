open Tile

module Imagemagickcmds = struct 
  let resolution = (1920, 1080)

  let paint (arrangement : Tile.arrangement) = (
    print_endline ("ImageMagick cmd -- " ^ ((arrangement |> List.hd).file_path |> Option.get));
    let cmd = ref ("magick -size " ^ 
        string_of_int (resolution |> fst) ^ "x" ^ 
        string_of_int (resolution |> snd) ^ " xc:white ") in 
    List.map (fun (tile : Tile.tile) -> 
      List.map (fun (coord : Tile.coords) -> (
        cmd := (!cmd ^ " " ^ (Option.get tile.file_path) ^ " -geometry " ^ 
          (tile.depth |> Float.round |> int_of_float |> string_of_int) ^ "x" ^ 
          (tile.depth |> Float.round |> int_of_float |> string_of_int) ^ "+" ^
          string_of_int (coord.pixel |> fst) ^ "+" ^ 
          string_of_int (snd coord.pixel) ^ " -composite")
      )) tile.coords
    ) arrangement |> ignore;
    cmd := (!cmd ^ " io/test/output.png");
    (*print_endline (!cmd);*) 
    Sys.command !cmd
  )
end
