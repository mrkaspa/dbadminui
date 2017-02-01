module Main.ListView exposing (renderList)

import Html exposing (div, button, text, h2, input, ul, li)
import Main.Types exposing (Conn, ConnTuple, Msg(..), Model)
import Form exposing (Form)
import Main.ConnForm exposing (connFormView)


renderList : Model -> Html.Html Msg
renderList { conns } =
    ul []
        (List.map renderItem conns)


renderItem : ConnTuple -> Html.Html Msg
renderItem ( connModel, connForm ) =
    li []
        [ if connModel.displayForm then
            Html.map (ConnFormMsg connModel.order) (connFormView connForm)
          else
            text connModel.name
        ]
