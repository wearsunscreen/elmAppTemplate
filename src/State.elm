module State exposing (..)

import Random exposing (Seed, initialSeed)
import Task exposing (Task, perform)
import Time exposing (now)
import Types exposing (..)


init : ( Model, Cmd Msg )
init =
    ( Model "" "" "" Nothing Nothing, Cmd.none )


subs : Model -> Sub Msg
subs model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseWelcomeScreen ->
            model ! [ Task.perform StartApp Time.now ]

        StartApp time ->
            ( { model
                | startTime = Just time
                , randomSeed = Just (initialSeed (truncate time * 1000))
              }
            , Cmd.none
            )

        Name name ->
            ( { model | name = name }, Cmd.none )

        Password password ->
            ( { model | password = password }, Cmd.none )

        PasswordAgain password ->
            ( { model | passwordAgain = password }, Cmd.none )
