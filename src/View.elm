module View exposing (view)

import Html exposing (Html, div, program, table, tbody, td, text, th, thead, tr)
import Models exposing (Entry)


view : List Entry -> Html Msg
view entries =
    div []
        [ list entries
        ]


list : List Entry -> Html Msg
list entries =
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
