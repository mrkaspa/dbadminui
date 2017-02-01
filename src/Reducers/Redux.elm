module Reducers.Redux exposing (init, update)

import Navigation
import Common.Types exposing (Conn, ConnForm, Msg(..), Model, connToForm, formToConn)
import Form
import Components.ConnForm exposing (initConnForm, validation)
import Reducers.ConnRedux as ConnRedux
import Reducers.CurrentRedux as CurrentRedux
import Reducers.CmdRedux as CmdRedux


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( Model location [], Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ current, conns } as model) =
    ( { model
        | current = CurrentRedux.update msg current
        , conns = ConnRedux.update msg conns
      }
    , CmdRedux.update msg model
    )
