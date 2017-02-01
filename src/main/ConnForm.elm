module Main.ConnForm exposing (connFormView, initConnForm, validation)

import Html exposing (text, div, label, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Main.Types exposing (Msg(..), Conn, ConnForm)
import Form exposing (Form)
import Form.Validate as Validate
import Form.Input as Input
import Form.Field as Field


initConnForm : Maybe ConnForm -> Form () ConnForm
initConnForm mayConn =
    let
        initialValues =
            case mayConn of
                Just conn ->
                    [ ( "name", Field.string conn.name )
                    ]

                Nothing ->
                    []
    in
        Form.initial initialValues validation


connFormView : Form () ConnForm -> Html.Html Form.Msg
connFormView form =
    let
        -- error presenter
        errorFor field =
            case field.liveError of
                Just error ->
                    -- replace toString with your own translations
                    div [ class "error" ] [ text (toString error) ]

                Nothing ->
                    text ""

        -- fields states
        name =
            Form.getFieldAsString "name" form
    in
        div []
            [ label [] [ text "Name" ]
            , Input.textInput name []
            , errorFor name
            , button
                [ onClick Form.Submit ]
                [ text "Submit" ]
            ]


validation : Validate.Validation () ConnForm
validation =
    Validate.map ConnForm
        (Validate.field "name" Validate.string)
