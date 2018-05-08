module Views.Entries.New exposing (..)

import Html exposing (Html, button, div, input, label, option, select, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Models exposing (..)
import Msgs exposing (..)


newEntry : Model -> Html Msg
newEntry model =
    div []
        [ input [ placeholder "Amount", onInput EntryFormAmount ] []
        , input [ placeholder "Date", onInput EntryFormDate ] []
        , select [ onInput EntryFormKind ] kindOptions
        , button [ onClick AddEntry ] [ text "Add" ]
        ]


kindOptions : List (Html Msg)
kindOptions =
    [ option [ value "" ] [ text "Select an option" ]
    , option [ value "PROFIT" ] [ text "PROFIT" ]
    , option [ value "DEPOSIT" ] [ text "DEPOSIT" ]
    ]
