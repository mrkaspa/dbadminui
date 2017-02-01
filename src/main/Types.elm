module Main.Types exposing (Conn, ConnForm, ConnTuple, Msg(..), Model, connToForm, formToConn)

import Form exposing (Form)


type alias Model =
    { conns : List ConnTuple
    }


type alias ConnTuple =
    ( Conn, Form () ConnForm )


type alias Conn =
    { order : Int
    , name : String
    , displayForm : Bool
    }


type alias ConnForm =
    { name : String }


type Msg
    = NewConn Conn
    | Update Conn
    | Delete Conn
    | ListConn
    | ConnFormMsg Int Form.Msg


connToForm : Conn -> ConnForm
connToForm conn =
    ConnForm conn.name


formToConn : ConnForm -> Conn -> Conn
formToConn connForm conn =
    { conn | name = connForm.name }
