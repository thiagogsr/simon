module DateValidate exposing (ifInvalidDate)

import Date exposing (Date)
import Validate exposing (Validator, ifTrue)


isValidDate : String -> Bool
isValidDate date =
    case Date.fromString date of
        Ok _ ->
            True

        Err _ ->
            False


ifInvalidDate : (subject -> String) -> error -> Validator error subject
ifInvalidDate subjectToString error =
    ifTrue (\subject -> isValidDate (subjectToString subject)) error
