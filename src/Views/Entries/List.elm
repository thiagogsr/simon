module Views.Entries.List exposing (entries)

import Html exposing (Html, div, table, tbody, td, text, th, thead, tr)
import Models exposing (Entry)
import Msgs exposing (Msg)


entries : List Entry -> Html Msg
entries entries =
    div []
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Date" ]
                    , th [] [ text "Amount" ]
                    , th [] [ text "Kind" ]
                    ]
                ]
            , tbody [] (List.map entryRow entries)
            ]
        ]


entryRow : Entry -> Html Msg
entryRow entry =
    tr []
        [ td [] [ text (toString entry.date) ]
        , td [] [ text (toString entry.amount) ]
        , td [] [ text (toString entry.kind) ]
        ]
