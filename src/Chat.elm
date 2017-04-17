module Chat exposing (..)

import Html exposing (..)
import Msgs exposing (..)
import View exposing (view)
import Models exposing (Model)
import Update exposing (update)
import WebSocket

main: Program Never Model Msg
main =
  Html.program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }

init : (Model, Cmd Msg)
init =
 ( Model "" []
 , Cmd.none
 )






 -- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  WebSocket.listen "ws://localhost:3000" NewChatMessage
