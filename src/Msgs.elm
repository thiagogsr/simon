module Msgs exposing (..)


type Msg
    = NoOp
    | AddEntry
    | EntryFormAmount String
    | EntryFormDate String
    | EntryFormKind String
