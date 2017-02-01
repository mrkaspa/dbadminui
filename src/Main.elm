port module Main exposing (..)

import Html exposing (program, div)
import Html.Attributes exposing (..)
import Main.ListView exposing (renderList)
import Main.HeaderView exposing (renderHeader)
import Main.ConnForm exposing (initConnForm, validation)
import Main.Types exposing (Conn, ConnForm, Msg(..), Model, connToForm, formToConn)
import Main.CommonStyles exposing (bgColor)
import Form exposing (Form)
import Form.Validate as Validate
import Form.Input as Input


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


init : ( Model, Cmd Msg )
init =
    ( Model [], Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ conns } as model) =
    case msg of
        NewConn conn ->
            let
                offConns =
                    (List.map (\( conn, form ) -> ( { conn | displayForm = False }, form )) conns)

                newTuple =
                    ( conn, initConnForm (Just (connToForm conn)) )

                newConns =
                    offConns ++ [ newTuple ]
            in
                ( { model | conns = newConns }, Cmd.none )

        ConnFormMsg order formMsg ->
            let
                newConns =
                    List.map (updateForm order formMsg) conns
            in
                ( { model | conns = newConns }, Cmd.none )

        _ ->
            ( model, Cmd.none )


updateForm order formMsg (( conn, form ) as connTuple) =
    case formMsg of
        Form.Submit ->
            if conn.order == order then
                let
                    newForm =
                        Form.update validation formMsg form

                    newConnForm =
                        (Form.getOutput newForm |> Maybe.withDefault (connToForm conn))

                    getErr =
                        Form.getErrors newForm
                in
                    ( formToConn newConnForm conn, newForm )
            else
                connTuple

        evt ->
            ( Debug.log (toString evt) conn, Form.update validation formMsg form )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


mainStyle : List ( String, String )
mainStyle =
    [ ( "font-family", "Open Sans, sans-serif" )
    , ( "background-color", bgColor )
    , ( "height", "100%" )
    ]


view : Model -> Html.Html Msg
view model =
    div [ style mainStyle ]
        [ renderHeader model
        , renderList model
        ]
