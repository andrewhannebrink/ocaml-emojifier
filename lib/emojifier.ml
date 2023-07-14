open Mock
open Scroll
open Transform
open Imagemagickcmds
open Db

module Emojifier = struct 
  print_endline "created arrangements table";
  Db.create_arrangements_table
  type arguments = {
    make_arrangements_only : bool;
    render_images_only : bool
  }
  let test (args : arguments) = 
    if not args.render_images_only then
      Scroll.step 
        Mock.unit_arrangement
        (Transform.ScrollStep {
          direction= (0.5, 0.5);
          speed = 0.69;
          refill_mode = `Random;
        })
      |> Imagemagickcmds.paint
      |> ignore 
    else
      ();

    if not args.make_arrangements_only then
      print_endline "rendering images TODO"
    else
      ()
end
