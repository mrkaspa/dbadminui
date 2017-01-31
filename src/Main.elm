port module Main exposing (..)

import Html exposing (program, div)
import Html.Attributes exposing (..)
import Main.ListView exposing (renderList)
import Main.HeaderView exposing (renderHeader)
import Main.Types exposing (Conn, Msg(..))


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { conns : List Conn
    }


init : ( Model, Cmd Msg )
init =
    ( Model [ Conn 1 "demo" ], Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewConn conn ->
            ( { model | conns = conn :: model.conns }, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


mainStyle : List ( String, String )
mainStyle =
    [ ( "font-family", "Open Sans, sans-serif" )
    , ( "background-color", "#3E4047" )
    , ( "height", "100%" )
    ]


view : Model -> Html.Html Msg
view model =
    div [ style mainStyle ]
        [ renderHeader
        , renderList model.conns
        ]
