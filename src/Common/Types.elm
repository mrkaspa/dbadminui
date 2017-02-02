module Common.Types exposing (Conn, ConnForm, ConnTuple, Msg(..), Model, connToForm, formToConn)

import Form exposing (Form)
import Navigation


type alias Model =
    { current : Navigation.Location
    , conns : List ConnTuple
    }


type alias ConnTuple =
    ( Conn, Form () ConnForm )


type alias Conn =
    { order : Int
    , displayForm : Bool
    , name : String
    , host : String
    , portNumber : Int
    , user : String
    , pass : String
    , database : String
    }


type alias ConnForm =
    { name : String
    , host : String
    , portNumber : Int
    , user : String
    , pass : String
    , database : String
    }


type Msg
    = UrlChange Navigation.Location
    | NewConn Conn
    | Update Conn
    | Delete Conn
    | ListConn
    | ConnFormMsg Int Form.Msg


connToForm : Conn -> ConnForm
connToForm conn =
    ConnForm conn.name conn.host conn.portNumber conn.user conn.pass conn.database


formToConn : ConnForm -> Conn -> Conn
formToConn connForm conn =
    { conn | name = connForm.name, host = connForm.host, portNumber = connForm.portNumber, user = connForm.user, pass = connForm.pass, database = connForm.database }
