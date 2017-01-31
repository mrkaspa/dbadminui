module Main.ListView exposing (renderList)

import Html exposing (div, button, text, h2, input, ul, li)
import Main.Types exposing (Conn, Msg)


renderList : List Conn -> Html.Html Msg
renderList conns =
    ul []
        (List.map renderItem conns)


renderItem : Conn -> Html.Html Msg
renderItem conn =
    li [] [ text conn.name ]
