module Model exposing (..)

import Maybe exposing (Maybe)
import Random exposing (Seed)
import Time exposing (Posix)


type alias Model =
    { randomSeed : Maybe Seed
    , startTime : Maybe Posix
    }


type Msg
    = CloseWelcomeScreen
    | StartApp Posix
