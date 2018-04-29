module Models exposing (..)


type Kind
    = PROFIT
    | DEPOSIT


type alias Model =
    { entries : List Entry
    , entryForm : Entry
    }


initialModel : Model
initialModel =
    { entries = []
    , entryForm = Entry Nothing Nothing Nothing
    }


type alias Entry =
    { amount : Maybe Float
    , date : Maybe String
    , kind : Maybe Kind
    }
