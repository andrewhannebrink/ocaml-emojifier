open Emojifier

let render_images_only = ref false
let make_arrangements_only = ref false
let speclist =
 [(
   "-make-arrangements-only",
   Arg.Set make_arrangements_only,
   "Write arrangements to db"
 );
 (
   "-render-images-only",
   Arg.Set render_images_only,
   "Read arrangements from db and generate imagemagick frames"
 )]

let () =
  Arg.parse speclist print_endline "Usage: emojifier [options]";
  (* print each arg *)
  print_endline ("render_images_only: " ^ (string_of_bool !render_images_only));
  print_endline ("make_arrangements_only: " ^ (string_of_bool !make_arrangements_only));
  Emojifier.test {
    render_images_only = !render_images_only;
    make_arrangements_only = !make_arrangements_only
  }
