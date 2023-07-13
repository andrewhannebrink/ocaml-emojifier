open Mock
open Scroll
open Transform
open Imagemagickcmds
open Db

module Emojifier = struct 
  print_endline "created arrangements table";
  Db.create_arrangements_table
  let test = Scroll.step 
    Mock.sample_arrangement
    (Transform.ScrollStep {
      direction= (0.5, 0.5);
      speed = 0.69;
      refill_mode = `Random;
    })
    |> Imagemagickcmds.paint
    |> ignore 
end
