module Update exposing (..)

import Msgs exposing (..)
import Models exposing (Model,ChatMessage)
import WebSocket
import Json.Decode as Decode
import Json.Decode exposing (Decoder, string)
import Json.Decode.Pipeline exposing (decode, required, requiredAt)

update : Msg -> Model -> (Model, Cmd Msg)
update msg {userMessage, chatMessages} =
  case msg of
    PostChatMessage ->
        ( Model "" chatMessages, WebSocket.send "ws://localhost:3000/" userMessage)

    UpdateUserMessage newMessage ->
      (Model newMessage chatMessages, Cmd.none)

    NewChatMessage newMessage ->
        let
          messageDecoder = newMessage
        in
        (Model userMessage (messageDecoder :: chatMessages), Cmd.none)


messageDecoder :  Decoder ChatMessage
messageDecoder  =
   decode ChatMessage
   |> required "command" string
   |> required "content" string
