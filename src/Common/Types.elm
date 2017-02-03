module Common.Types exposing (Conn, ConnForm, ConnJSON, ConnTuple, Msg(..), Model, connToForm, formToConn, jsonToConn)

import Form exposing (Form)
import Navigation
import Http


type alias Model =
    { current : Navigation.Location
    , conns : List ConnTuple
    }


type alias ConnTuple =
    ( Conn, Form () ConnForm )


type alias Conn =
    { order : Int
    , displayForm : Bool
    , id : Int
    , name : String
    , host : String
    , portNumber : Int
    , user : String
    , pass : String
    , database : String
    }


type alias ConnJSON =
    { id : Int
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
    | ConnSaved (Result Http.Error Conn)


connToForm : Conn -> ConnForm
connToForm conn =
    ConnForm conn.name conn.host conn.portNumber conn.user conn.pass conn.database


formToConn : ConnForm -> Conn -> Conn
formToConn connForm conn =
    { conn | name = connForm.name, host = connForm.host, portNumber = connForm.portNumber, user = connForm.user, pass = connForm.pass, database = connForm.database }


jsonToConn : ConnJSON -> Conn -> Conn
jsonToConn connJSON conn =
    { conn | id = connJSON.id, name = connJSON.name, host = connJSON.host, portNumber = connJSON.portNumber, user = connJSON.user, pass = connJSON.pass, database = connJSON.database }
