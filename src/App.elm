module Main exposing (..)

import Browser exposing (document)
import Model exposing (Model, Msg)
import Update exposing (subs, update)
import View exposing (view)


main : Program () Model Msg
main =
    Browser.document
        { init = Update.init
        , update = Update.update
        , view = View.view
        , subscriptions = Update.subs
        }
