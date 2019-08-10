module Main exposing (Model, Msg(..), init, main, update, view, viewStuff, viewWelcome)

import Browser exposing (Document, document)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Maybe exposing (Maybe)
import Random exposing (Seed, initialSeed, int, maxInt, minInt, step)
import String exposing (fromInt)
import Task exposing (Task, perform)
import Time exposing (Posix, now, posixToMillis)


type alias Model =
    { randomSeed : Maybe Seed
    , startTime : Maybe Posix
    }


type Msg
    = CloseWelcomeScreen
    | StartApp Posix


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Nothing Nothing, Cmd.none )


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


view : Model -> Html Msg
view model =
    case model.startTime of
        Nothing ->
            viewWelcome model

        Just t ->
            viewStuff model


viewStuff : Model -> Html Msg
viewStuff model =
    let
        seed =
            case model.randomSeed of
                Nothing ->
                    "unknown"

                Just s ->
                    Random.step (int minInt maxInt) s
                        |> Tuple.first
                        |> fromInt

        time =
            case model.startTime of
                Nothing ->
                    "unknown"

                Just t ->
                    t |> posixToMillis |> fromInt
    in
    div []
        [ p []
            [ text "Start time is "
            , text time
            ]
        , p []
            [ text "Your psuedo random number is  "
            , text seed
            ]
        ]


viewWelcome : Model -> Html Msg
viewWelcome model =
    div []
        [ p [] [ h1 [] [ text "Welcome!" ] ]
        , button [ onClick CloseWelcomeScreen ] [ text "Ok" ]
        ]
