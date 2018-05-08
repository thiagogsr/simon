module Update exposing (update)

import Models exposing (..)
import Msgs exposing (..)
import Validate exposing (validate)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddEntry ->
            case validate modelValidator model.newEntry of
                [] ->
                    let
                        amount =
                            Result.withDefault 0 (String.toFloat model.newEntry.amount)

                        kind =
                            case model.newEntry.kind of
                                "PROFIT" ->
                                    PROFIT

                                "DEPOSIT" ->
                                    DEPOSIT

                                _ ->
                                    PROFIT

                        entry =
                            Entry amount model.newEntry.date kind
                    in
                    ( { model | entries = entry :: model.entries, errors = [] }, Cmd.none )

                errors ->
                    ( { model | errors = errors }, Cmd.none )

        EntryFormAmount amount ->
            let
                oldEntryForm =
                    model.newEntry
            in
            ( { model | newEntry = { oldEntryForm | amount = amount } }, Cmd.none )

        EntryFormDate date ->
            let
                oldEntryForm =
                    model.newEntry
            in
            ( { model | newEntry = { oldEntryForm | date = date } }, Cmd.none )

        EntryFormKind kind ->
            let
                oldEntryForm =
                    model.newEntry
            in
            ( { model | newEntry = { oldEntryForm | kind = kind } }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
