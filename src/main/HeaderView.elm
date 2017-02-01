module Main.HeaderView exposing (renderHeader)

import Html exposing (div, a, text)
import Main.Types exposing (Msg(..), Conn)
import Html.Events exposing (onClick)
import InlineHover exposing (hover)
import Html.Attributes exposing (..)
import Main.Types exposing (Model)
import Main.CommonStyles exposing (mainColor, secondaryColor, bgColor)


renderHeader : Model -> Html.Html Msg
renderHeader { conns } =
    div [ style headerStyle ]
        [ div [ style innerStyle ]
            [ div [ style textStyle ]
                [ text "You are using the free trial"
                ]
            , div [ style divStyle ]
                [ hover buttonHoverStyle a [ style buttonStyle, href "#" ] [ text "Buy Program" ]
                , hover buttonHoverStyle a [ style buttonStyle, href "#" ] [ text "Activate" ]
                ]
            , div [ style divStyle ]
                [ hover buttonHoverStyle a [ style buttonStyle, href "#", onClick (NewConn (Conn (List.length conns) "This is new" True)) ] [ text "New Connection" ]
                ]
            ]
        ]


headerStyle : List ( String, String )
headerStyle =
    [ ( "border", "4px solid " ++ mainColor )
    , ( "padding", "10px" )
    , ( "display", "flex" )
    , ( "justify-content", "flex-end" )
    ]


innerStyle : List ( String, String )
innerStyle =
    [ ( "flex-direction", "column" )
    , ( "display", "flex" )
    , ( "justify-content", "flex-end" )
    , ( "flex", "0.5" )
    ]


divStyle : List ( String, String )
divStyle =
    [ ( "justify-content", "space-between" )
    , ( "display", "flex" )
    , ( "margin", "5px" )
    ]


textStyle : List ( String, String )
textStyle =
    [ ( "color", mainColor )
    , ( "text-align", "center" )
    , ( "font-size", "1.5em" )
    ]


buttonStyle : List ( String, String )
buttonStyle =
    [ ( "border", "1px solid " ++ mainColor )
    , ( "background-color", secondaryColor )
    , ( "text-decoration", "none" )
    , ( "border-radius", "2px" )
    , ( "color", bgColor )
    , ( "flex", "1" )
    , ( "padding", "5px" )
    , ( "margin", "5px" )
    , ( "text-align", "center" )
    ]


buttonHoverStyle : List ( String, String )
buttonHoverStyle =
    [ ( "background-color", mainColor )
    ]
