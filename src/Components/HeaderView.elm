module Components.HeaderView exposing (renderHeader)

import Html exposing (div, a, text)
import Common.Types exposing (Msg(..), Conn, ConnTuple)
import Html.Events exposing (onClick)
import InlineHover exposing (hover)
import Html.Attributes exposing (..)
import Common.Types exposing (Model)


renderHeader : Model -> Html.Html Msg
renderHeader { conns } =
    div [ class "header" ]
        [ div []
            [ div [ class "textContainer" ]
                [ text "You are using the free trial"
                ]
            , div [ class "buttonContainer" ]
                [ a [ href "#" ] [ text "Buy Program" ]
                , a [ href "#" ] [ text "Activate" ]
                ]
            , div [ class "buttonContainer" ]
                [ a [ href "#", onClick (NewConn (newConn conns)) ] [ text "New Connection" ]
                ]
            ]
        ]


newConn : List ConnTuple -> Conn
newConn conns =
    Conn ((List.length conns) + 1) True -1 "This is new" "localhost" 9090 "" "" ""
