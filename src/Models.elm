module Models exposing (..)

import DateValidate exposing (ifInvalidDate)
import FloatValidate exposing (ifNotFloat)
import Validate exposing (Validator, ifBlank)


type Category
    = PROFIT
    | DEPOSIT


type FormField
    = Amount
    | Date
    | Kind


type alias Error =
    ( FormField, String )


type alias Model =
    { entries : List Entry
    , newEntry : EntryForm
    , errors : List Error
    }


initialModel : Model
initialModel =
    { entries = []
    , newEntry = EntryForm "" "" ""
    , errors = []
    }


modelValidator : Validator Error EntryForm
modelValidator =
    Validate.all
        [ Validate.firstError
            [ ifBlank .amount ( Amount, "Please enter an amount." )
            , ifNotFloat .amount ( Amount, "Please enter a valid amount." )
            ]
        , Validate.firstError
            [ ifBlank .date ( Date, "Please enter a date." )
            , ifInvalidDate .date ( Date, "Please enter a valid date." )
            ]
        , ifBlank .kind ( Kind, "Please select a kind." )
        ]


type alias Entry =
    { amount : Float
    , date : String
    , kind : Category
    }


type alias EntryForm =
    { amount : String
    , date : String
    , kind : String
    }
