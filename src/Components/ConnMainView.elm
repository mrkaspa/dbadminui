module Components.ConnMainView exposing (renderConnMain)

import Components.ListView exposing (renderList)
import Components.HeaderView exposing (renderHeader)
import Common.Styles exposing (bgColor)
import Html exposing (div, text)
import Html.Attributes exposing (..)
import Common.Types exposing (Msg(..), Model)


renderConnMain : Model -> Html.Html Msg
renderConnMain model =
    div [ style mainStyle ]
        [ renderHeader model
        , renderList model
        ]


mainStyle : List ( String, String )
mainStyle =
    [ ( "font-family", "Open Sans, sans-serif" )
    , ( "background-color", bgColor )
    , ( "height", "100%" )
    ]
