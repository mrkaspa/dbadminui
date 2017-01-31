module Main.Types exposing (Conn, Msg(..))


type alias Conn =
    { id : Int
    , name : String
    }


type Msg
    = NewConn Conn
    | Update Conn
    | Delete Conn
    | ListConn
