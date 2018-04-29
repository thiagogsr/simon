module Views.Entries.List exposing (entries)

import Html exposing (Html, div, table, tbody, td, text, th, thead, tr)
import Maybe exposing (withDefault)
import Models exposing (..)
import Msgs exposing (Msg)


entries : Model -> Html Msg
entries model =
    div []
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Date" ]
                    , th [] [ text "Amount" ]
                    , th [] [ text "Kind" ]
                    ]
                ]
            , tbody [] (List.map entryRow model.entries)
            ]
        ]


entryRow : Entry -> Html Msg
entryRow entry =
    tr []
        [ td [] [ text (withDefault "" entry.date) ]
        , td [] [ text (toString (withDefault 0 entry.amount)) ]
        , td [] [ text (toString (withDefault PROFIT entry.kind)) ]
        ]
