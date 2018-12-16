module LigatureTests exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Example test file"
        [ describe "always succeed, lets look at ligatures!"
            [ test "they look great with Haslig and Fira Code fonts" <|
                \_ ->
                    Expect.true "all should be true"
                        (List.all
                            ((==) True)
                            [ 1 >= 1
                            , 1 <= 1

                            -- , 1 /= 0 -- bizareness - 1 /= 0 evaluates to 1 : Bool - I would expect True : Bool
                            , 1 :: [ 2, 3 ] == [ 1, 2, 3 ]
                            ]
                        )
            , test "compostion ligatures" <|
                \_ ->
                    let
                        g =
                            (\n -> n * 2) << (\n -> n * 3)

                        h =
                            g >> (\n -> n * 4)
                    in
                    Expect.equal (h 2) (2 * 2 * 3 * 4)
            , test "simliar looking character are distinct" <|
                \_ ->
                    let
                        x =
                            "1LilIlse10O"

                        y =
                            "1lilo0"

                        z =
                            "1LILO0"
                    in
                    Expect.notEqual x y
            ]
        ]
