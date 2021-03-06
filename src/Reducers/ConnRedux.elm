module Reducers.ConnRedux exposing (update)

import Common.Types exposing (Conn, ConnForm, ConnTuple, Msg(..), Model, connToForm, formToConn)
import Form
import Components.ConnForm exposing (initConnForm, validation)
import Http exposing (Error(..))


update : Msg -> List ConnTuple -> List ConnTuple
update msg conns =
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
                newConns

        ConnFormMsg order formMsg ->
            List.map (updateForm order formMsg) conns

        ConnSaved result ->
            case result of
                Ok connSaved ->
                    let
                        newConn =
                            { connSaved | displayForm = False }
                    in
                        List.map
                            (\( conn, form ) ->
                                if conn.order == connSaved.order then
                                    ( connSaved, form )
                                else
                                    ( conn, form )
                            )
                            conns

                -- TODO we go here
                Err (BadStatus resp) ->
                    conns

                Err _ ->
                    conns

        _ ->
            conns


updateForm : Int -> Form.Msg -> ConnTuple -> ConnTuple
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

        _ ->
            ( conn, Form.update validation formMsg form )
