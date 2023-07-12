open Mock
open Scroll
open Transform
open Imagemagickcmds

module Emojifier = struct 
  let test = Scroll.step 
    Mock.sample_arrangement
    (Transform.ScrollStep {
      direction= (0.5, 0.5);
      speed = 0.69;
    })
    |> Imagemagickcmds.paint
    |> ignore 
end
