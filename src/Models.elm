module Models exposing (Entry, Model, initialModel)


type Kind
    = PROFIT
    | DEPOSIT


type alias Model =
    { entries : List Entry
    }


initialModel : Model
initialModel =
    { entries = [ Entry 0.03496422 "2018-05-01" PROFIT ]
    }


type alias Entry =
    { amount : Float
    , date : String
    , kind : Kind
    }
