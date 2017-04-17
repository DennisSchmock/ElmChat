module Models exposing (..)


-- MODEL
type alias Model =
 { userMessage : String,
 chatMessages : List ChatMessage

 }



type alias ChatMessage =
 { command: String
 , content: String
 }
