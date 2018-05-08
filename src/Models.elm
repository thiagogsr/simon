module Models exposing (..)


type Kind
    = PROFIT
    | DEPOSIT


type alias Model =
    { entries : List Entry
    , newEntry : EntryForm
    }


initialModel : Model
initialModel =
    { entries = []
    , newEntry = EntryForm Nothing Nothing Nothing
    }


type alias Entry =
    { amount : Float
    , date : String
    , kind : Kind
    }


type alias EntryForm =
    { amount : Maybe String
    , date : Maybe String
    , kind : Maybe String
    }
