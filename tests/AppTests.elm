module AppTests exposing (suite)

import Expect exposing (true)
import Fuzz exposing (int)
import Html.Events exposing (..)
import Main exposing (..)
import Test exposing (..)
import Test.Html.Event as E
import Test.Html.Query as Q
import Test.Html.Selector as S
import Time exposing (millisToPosix)
import Tuple exposing (first)


suite : Test
suite =
    describe "Views"
        [ test "Welcome view has an OK button" <|
            \() ->
                viewWelcome (init () |> first)
                    |> Q.fromHtml
                    |> Q.find [ S.tag "button" ]
                    |> Q.has [ S.text "Ok" ]
        , test "OK button returns a CloseWelcomeScreen" <|
            \() ->
                viewWelcome (init () |> first)
                    |> Q.fromHtml
                    |> Q.find [ S.tag "button" ]
                    |> E.simulate E.click
                    |> E.expect CloseWelcomeScreen
        , fuzz int "Starting the app gives us a new random seed" <|
            \r1 ->
                let
                    model =
                        init () |> first
                in
                update (StartApp (Time.millisToPosix r1)) model
                    |> first
                    |> .randomSeed
                    |> Expect.notEqual model.randomSeed
        ]
