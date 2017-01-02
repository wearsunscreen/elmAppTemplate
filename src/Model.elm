module Model exposing (..)

import Maybe exposing (Maybe)
import Random exposing (Seed)
import Time exposing (Time)


type alias Model =
    { randomSeed : Maybe Seed
    , startTime : Maybe Time
    }


type Msg
    = CloseWelcomeScreen
    | StartApp Time
