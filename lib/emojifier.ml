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
    let _ = match args with
    { make_arrangements_only; render_images_only = _ } -> 
        print_endline ("making arrangements" ^ (string_of_bool make_arrangements_only)) in
    Scroll.step 
      Mock.unit_arrangement
      (Transform.ScrollStep {
        direction= (0.5, 0.5);
        speed = 0.69;
        refill_mode = `Random;
      })
    |> Imagemagickcmds.paint
    |> ignore 
end
