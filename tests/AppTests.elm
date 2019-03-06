module TestStub exposing (suite)

import Expect exposing (true)
import Fuzz exposing (int)
import Html.Events exposing (..)
import Model exposing (..)
import Test exposing (..)
import Test.Html.Event as E
import Test.Html.Query as Q
import Test.Html.Selector as S
import Time exposing (millisToPosix)
import Tuple exposing (first)
import Update
import View


suite : Test
suite =
    describe "Views"
        [ test "Welcome view has an OK button" <|
            \() ->
                View.viewWelcome (Update.init () |> first)
                    |> Q.fromHtml
                    |> Q.find [ S.tag "button" ]
                    |> Q.has [ S.text "OK" ]
        , test "OK button returns a CloseWelcomeScreen" <|
            \() ->
                View.viewWelcome (Update.init () |> first)
                    |> Q.fromHtml
                    |> Q.find [ S.tag "button" ]
                    |> E.simulate E.click
                    |> E.expect CloseWelcomeScreen
        , test "Main view has an restart button" <|
            \() ->
                View.viewStuff (Update.init () |> first)
                    |> Q.fromHtml
                    |> Q.find [ S.tag "button" ]
                    |> Q.has [ S.text "Restart" ]
        , test "Restart button returns a CloseWelcomeScreen" <|
            \() ->
                View.viewStuff (Update.init () |> first)
                    |> Q.fromHtml
                    |> Q.find [ S.tag "button" ]
                    |> E.simulate E.click
                    |> E.expect CloseWelcomeScreen
        , fuzz int "Starting the app gives us a new random seed" <|
            \r1 ->
                let
                    model =
                        Update.init () |> first
                in
                Update.update (StartApp (Time.millisToPosix r1)) model
                    |> first
                    |> .randomSeed
                    |> Expect.notEqual model.randomSeed
        ]
