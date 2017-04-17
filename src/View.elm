module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (Model, ChatMessage)
import Msgs exposing (..)

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ textarea [ class "textarea" ]  (List.map viewMessage (List.reverse model.chatMessages))
    ,br[][]
    ,input [ placeholder "message..."
            , autofocus True
            , value model.userMessage
            , onInput UpdateUserMessage
            ] []
    , button [ onClick PostChatMessage ] [ text "Submit" ]

    ]


viewMessage : ChatMessage -> Html msg
viewMessage msg =
  div [] [  text msg.content ]
