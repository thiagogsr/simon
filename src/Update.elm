module Update exposing (update)

import Models exposing (..)
import Msgs exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddEntry ->
            ( { model | entries = model.entryForm :: model.entries }, Cmd.none )

        EntryFormAmount amount ->
            let
                oldEntryForm =
                    model.entryForm

                updatedEntry =
                    case String.toFloat amount of
                        Ok amount ->
                            { oldEntryForm | amount = Just amount }

                        Err error ->
                            oldEntryForm
            in
            ( { model | entryForm = updatedEntry }, Cmd.none )

        EntryFormDate date ->
            let
                oldEntryForm =
                    model.entryForm

                updatedEntry =
                    if String.isEmpty date then
                        oldEntryForm
                    else
                        { oldEntryForm | date = Just date }
            in
            ( { model | entryForm = updatedEntry }, Cmd.none )

        EntryFormKind kind ->
            let
                oldEntryForm =
                    model.entryForm

                newKind =
                    if kind == "PROFIT" then
                        PROFIT
                    else
                        DEPOSIT

                updatedEntry =
                    { oldEntryForm | kind = Just newKind }
            in
            ( { model | entryForm = updatedEntry }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
