module Model exposing (..)

import Maybe exposing (Maybe)
import Random exposing (Seed)
import Time exposing (Time)


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    , randomSeed : Maybe Seed
    , startTime : Maybe Time
    }


type Msg
    = CloseWelcomeScreen
    | StartApp Time
    | Name String
    | Password String
    | PasswordAgain String
