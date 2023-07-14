open Tile

module Db = struct 
  let conn = Sqlite3.db_open "big_mama.db"
  let create_arrangements_table = (
    print_endline "howdy";
    Sqlite3.exec conn 
      "CREATE TABLE IF NOT EXISTS arrangements (\
        id INTEGER PRIMARY KEY AUTOINCREMENT, \
        tag VARCHAR NOT NULL, \
        quadrant VARCHAR NOT NULL, \
        frame INTEGER NOT NULL, \
        CONSTRAINT unique_tag UNIQUE (tag, quadrant, frame));"
    |> Sqlite3.Rc.check;
  )
  let insert_arrangement (arrangement : Tile.arrangement) tag quadrant frame = 
    (List.hd arrangement).file_path |> Option.get |> print_endline;
    let sql = Printf.sprintf 
        "INSERT INTO arrangements (tag, quadrant, frame) \
        VALUES ('%s', '%s', %d);" 
        tag quadrant frame in
    Sqlite3.exec conn sql |> Sqlite3.Rc.check
end
