module Example exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Stub for tests"
        [ test "Stub" <|
            \_ ->
                Expect.true "it's just True" True
        ]
