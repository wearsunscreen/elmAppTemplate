module Update exposing (..)

import Model exposing (..)
import Random exposing (Seed, initialSeed)
import Task exposing (Task, perform)
import Time exposing (now, posixToMillis)


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Nothing Nothing, Cmd.none )


subs : Model -> Sub Msg
subs model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseWelcomeScreen ->
            ( model, Task.perform StartApp Time.now )

        StartApp time ->
            ( { model
                | startTime = Just time
                , randomSeed = Just (initialSeed (posixToMillis time))
              }
            , Cmd.none
            )
