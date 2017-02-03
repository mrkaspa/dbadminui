module Reducers.SaveConnSaga exposing (saveConn)

import Common.Types exposing (Msg(..), Conn, ConnJSON, jsonToConn)
import Json.Encode as Encode
import Json.Decode.Pipeline as Pipeline
import Json.Decode as Decode exposing (Decoder)
import Http exposing (post, stringBody)


saveConn : Conn -> Cmd Msg
saveConn conn =
    conn
        |> encodeConn
        |> sendConn conn


encodeConn : Conn -> Http.Body
encodeConn conn =
    Encode.object
        [ ( "name", Encode.string conn.name )
        , ( "host", Encode.string conn.host )
        , ( "user", Encode.string conn.user )
        , ( "pass", Encode.string conn.pass )
        , ( "name", Encode.string conn.name )
        , ( "port", Encode.int conn.portNumber )
        , ( "dbname", Encode.string conn.database )
        ]
        |> Encode.encode 0
        |> stringBody "application/json"


decodeConn : Decoder ConnJSON
decodeConn =
    Pipeline.decode ConnJSON
        |> Pipeline.required "id" Decode.int
        |> Pipeline.required "name" Decode.string
        |> Pipeline.required "host" Decode.string
        |> Pipeline.required "portNumber" Decode.int
        |> Pipeline.required "user" Decode.string
        |> Pipeline.required "pass" Decode.string
        |> Pipeline.required "database" Decode.string


sendConn : Conn -> Http.Body -> Cmd Msg
sendConn conn payload =
    Http.send (parse conn)
        (Http.post "/"
            payload
            decodeConn
        )


parse : Conn -> Result Http.Error ConnJSON -> Msg
parse conn result =
    case result of
        Ok connJSON ->
            ConnSaved (Ok (jsonToConn connJSON conn))

        Err error ->
            ConnSaved (Err error)
