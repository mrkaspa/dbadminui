module Components.ConnForm exposing (connFormView, initConnForm, validation)

import Html exposing (text, div, label, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Common.Types exposing (Msg(..), Conn, ConnForm)
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
        name =
            Form.getFieldAsString "name" form

        host =
            Form.getFieldAsString "host" form

        portNumber =
            Form.getFieldAsString "portNumber" form

        user =
            Form.getFieldAsString "user" form

        pass =
            Form.getFieldAsString "pass" form

        database =
            Form.getFieldAsString "database" form
    in
        div []
            [ textField name "Name"
            , textField host "Host"
            , textField portNumber "Port"
            , textField user "Username"
            , textField pass "Password"
            , textField database "Database"
            , button
                [ onClick Form.Submit ]
                [ text "Submit" ]
            ]


errorFor : Form.FieldState () String -> Html.Html Form.Msg
errorFor field =
    case field.liveError of
        Just error ->
            -- replace toString with your own translations
            div [ class "error" ] [ text (toString error) ]

        Nothing ->
            text ""


textField : Form.FieldState () String -> String -> Html.Html Form.Msg
textField field labelName =
    div []
        [ label [] [ text labelName ]
        , Input.textInput field []
        , errorFor field
        ]


validation : Validate.Validation () ConnForm
validation =
    Validate.map6 ConnForm
        (Validate.field "name" Validate.string)
        (Validate.field "host" Validate.string)
        (Validate.field "portNumber" Validate.int)
        (Validate.field "user" Validate.string)
        (Validate.field "pass" Validate.string)
        (Validate.field "database" Validate.string)
