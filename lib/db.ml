module Db = struct 
  let conn = Sqlite3.db_open "cache.db"
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
end
