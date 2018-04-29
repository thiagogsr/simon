module Views.App exposing (view)

import Html exposing (Html)
import Models exposing (Model)
import Msgs exposing (Msg)
import Views.Entries exposing (entries)


view : Model -> Html Msg
view model =
    entries model.entries
