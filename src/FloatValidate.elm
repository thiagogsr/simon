module FloatValidate exposing (ifNotFloat)

import Validate exposing (Validator, ifTrue)


isFloat : String -> Bool
isFloat value =
    case String.toFloat value of
        Ok _ ->
            True

        Err _ ->
            False


ifNotFloat : (subject -> String) -> error -> Validator error subject
ifNotFloat subjectToString error =
    ifTrue (\subject -> isFloat (subjectToString subject)) error
