module Update exposing (update)

import Models exposing (..)
import Msgs exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddEntry ->
            let
                amount =
                    Result.withDefault 0 (String.toFloat (Maybe.withDefault "0" model.newEntry.amount))

                kind =
                    if model.newEntry.kind == Just "DEPOSIT" then
                        DEPOSIT
                    else
                        PROFIT

                entry =
                    Entry amount (Maybe.withDefault "0" model.newEntry.date) kind
            in
            ( { model | entries = entry :: model.entries }, Cmd.none )

        EntryFormAmount amount ->
            let
                oldEntryForm =
                    model.newEntry

                updatedEntry =
                    { oldEntryForm | amount = Just amount }
            in
            ( { model | newEntry = updatedEntry }, Cmd.none )

        EntryFormDate date ->
            let
                oldEntryForm =
                    model.newEntry

                updatedEntry =
                    { oldEntryForm | date = Just date }
            in
            ( { model | newEntry = updatedEntry }, Cmd.none )

        EntryFormKind kind ->
            let
                oldEntryForm =
                    model.newEntry

                updatedEntry =
                    { oldEntryForm | kind = Just kind }
            in
            ( { model | newEntry = updatedEntry }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
