module Reducers.CmdRedux exposing (update)

import Common.Types exposing (Msg(..), Model)
import Reducers.SaveConnSaga exposing (saveConn)


update : Msg -> Model -> Cmd Msg
update msg { conns } =
    case msg of
        ConnFormMsg order formMsg ->
            let
                connResult =
                    List.filterMap
                        (\( conn, _ ) ->
                            if conn.order == order then
                                Just conn
                            else
                                Nothing
                        )
                        conns
            in
                case connResult of
                    conn :: _ ->
                        saveConn conn

                    _ ->
                        Cmd.none

        _ ->
            Cmd.none
