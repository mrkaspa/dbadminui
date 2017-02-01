module Reducers.CurrentRedux exposing (update)

import Navigation
import Common.Types exposing (Msg(..), Model)


update : Msg -> Navigation.Location -> Navigation.Location
update msg current =
    case msg of
        UrlChange location ->
            location

        _ ->
            current
