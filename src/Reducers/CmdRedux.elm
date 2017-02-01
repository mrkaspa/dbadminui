module Reducers.CmdRedux exposing (update)

import Common.Types exposing (Msg(..), Model)


update : Msg -> Model -> Cmd Msg
update msg model =
    Cmd.none
