module Main.HeaderView exposing (renderHeader)

import Html exposing (div, a, text)
import Main.Types exposing (Msg(..), Conn)
import Html.Events exposing (onClick)
import InlineHover exposing (hover)
import Html.Attributes exposing (..)


renderHeader : Html.Html Msg
renderHeader =
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
                [ hover buttonHoverStyle a [ style buttonStyle, href "#", onClick (NewConn (Conn 0 "")) ] [ text "New Connection" ]
                ]
            ]
        ]


headerStyle : List ( String, String )
headerStyle =
    [ ( "border", "4px solid #FFBB0F" )
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
    [ ( "color", "#FFBB0F" )
    , ( "text-align", "center" )
    , ( "font-size", "1.5em" )
    ]


buttonStyle : List ( String, String )
buttonStyle =
    [ ( "border", "1px solid #FFBB0F" )
    , ( "background-color", "#a38860" )
    , ( "text-decoration", "none" )
    , ( "border-radius", "2px" )
    , ( "color", "#3E4047" )
    , ( "flex", "1" )
    , ( "padding", "5px" )
    , ( "margin", "5px" )
    , ( "text-align", "center" )
    ]


buttonHoverStyle : List ( String, String )
buttonHoverStyle =
    [ ( "background-color", "#FFBB0F" )
    ]
