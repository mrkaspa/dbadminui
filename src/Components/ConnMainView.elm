module Components.ConnMainView exposing (renderConnMain)

import Components.ListView exposing (renderList)
import Components.HeaderView exposing (renderHeader)
import Html exposing (div, text)
import Html.Attributes exposing (..)
import Common.Types exposing (Msg(..), Model)


renderConnMain : Model -> Html.Html Msg
renderConnMain model =
    div []
        [ renderHeader model
        , renderList model
        ]
