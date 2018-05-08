module Views.Entries.New exposing (..)

import Html exposing (Html, button, div, input, label, li, option, select, text, ul)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Models exposing (..)
import Msgs exposing (..)


newEntry : Model -> Html Msg
newEntry model =
    div []
        [ input [ placeholder "Amount", onInput EntryFormAmount ] []
        , viewFormErrors Amount model.errors
        , input [ placeholder "Date", onInput EntryFormDate ] []
        , viewFormErrors Date model.errors
        , select [ onInput EntryFormKind ] kindOptions
        , viewFormErrors Kind model.errors
        , button [ onClick AddEntry ] [ text "Add" ]
        ]


kindOptions : List (Html Msg)
kindOptions =
    [ option [ value "" ] [ text "Select an option" ]
    , option [ value "PROFIT" ] [ text "PROFIT" ]
    , option [ value "DEPOSIT" ] [ text "DEPOSIT" ]
    ]


viewFormErrors : FormField -> List Error -> Html msg
viewFormErrors field errors =
    errors
        |> List.filter (\( fieldError, _ ) -> fieldError == field)
        |> List.map (\( _, error ) -> li [] [ text error ])
        |> ul []
