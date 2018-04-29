module Views.Entries.New exposing (..)

import Html exposing (Html, button, div, input, option, select, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Models exposing (..)
import Msgs exposing (..)


newEntry : Model -> Html Msg
newEntry model =
    div []
        [ input [ placeholder "Amount", onInput EntryFormAmount ] []
        , input [ placeholder "Date", onInput EntryFormDate ] []
        , select [ onInput EntryFormKind ] (List.map kindOption [ PROFIT, DEPOSIT ])
        , button [ onClick AddEntry ] [ text "Add" ]
        ]


kindOption : Kind -> Html Msg
kindOption kind =
    option [] [ text (toString kind) ]
