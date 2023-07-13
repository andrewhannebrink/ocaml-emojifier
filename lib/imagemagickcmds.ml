open Tile

module Imagemagickcmds = struct 
  let paint (arrangement : Tile.arrangement) = (
    print_endline ("ImageMagick cmd -- " ^ ((arrangement |> List.hd).file_path |> Option.get));
    Sys.command "magick -size 1920x1080 xc:skyblue \
        io/lil_imgs/emoji_buffered/1f34d.png -geometry +0+0 -composite \
        io/lil_imgs/emoji_buffered/267b-fe0f.png -geometry +50+50 -composite \
        io/test/result.png"
  )
end
