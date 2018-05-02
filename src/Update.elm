module Update exposing (update)

import Models exposing (..)
import Msgs exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddEntry ->
            let
                new =
                    Entry (model.newEntry.amount) (model.newEntry.date)
            in
                ( { model | entries = new :: model.entries }, Cmd.none )

        EntryFormAmount amount ->
            let
                oldEntryForm =
                    model.newEntry

                updatedEntry =
                    case String.toFloat amount of
                        Ok amount ->
                            { oldEntryForm | amount = amount }

                        Err error ->
                            oldEntryForm
            in
                ( { model | newEntry = updatedEntry }, Cmd.none )

        EntryFormDate date ->
            let
                oldEntryForm =
                    model.newEntry

                updatedEntry =
                    if String.isEmpty date then
                        oldEntryForm
                    else
                        { oldEntryForm | date = date }
            in
                ( { model | newEntry = updatedEntry }, Cmd.none )

        EntryFormKind kind ->
            let
                oldEntryForm =
                    model.newEntry

                newKind =
                    if kind == "PROFIT" then
                        PROFIT
                    else
                        DEPOSIT

                updatedEntry =
                    { oldEntryForm | kind = newKind }
            in
                ( { model | newEntry = updatedEntry }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
