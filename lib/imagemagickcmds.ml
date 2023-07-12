open Tile

module Imagemagickcmds = struct 
  let paint (arrangement : Tile.arrangement) = 
    print_endline ("ImageMagick cmd -- " ^ ((arrangement |> List.hd).file_path |> Option.get));
    Sys.command "pwd";
end
