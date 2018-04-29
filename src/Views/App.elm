module Views.App exposing (view)

import Html exposing (Html, div)
import Models exposing (Model)
import Msgs exposing (Msg)
import Views.Entries.List exposing (entries)
import Views.Entries.New exposing (newEntry)


view : Model -> Html Msg
view model =
    div []
        [ newEntry model
        , entries model
        ]
