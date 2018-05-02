module Models exposing (..)


type Kind
    = PROFIT
    | DEPOSIT


type alias Model =
    { entries : List Entry
    , newEntry : Maybe Entry
    }


initialModel : Model
initialModel =
    { entries = []
    , newEntry = Nothing
    }


type alias Entry =
    { amount : Float
    , date : String
    , kind : Kind
    }
