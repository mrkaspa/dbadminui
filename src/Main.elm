port module Main exposing (..)

import Html exposing (div, text)
import Navigation
import Common.Types exposing (Msg(..), Model)
import Reducers.Redux exposing (init, update)
import Components.ConnMainView exposing (renderConnMain)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }


view : Model -> Html.Html Msg
view ({ current } as model) =
    case current.pathname of
        "/" ->
            renderConnMain model

        "/src/Main.elm" ->
            renderConnMain model

        path ->
            text (toString path ++ " Not found")
