import Browser
import Html exposing (Html, Attribute, button, div, text, input)
import Html.Events exposing (onClick)

main =
    Browser.sandbox {
        init     = init
        , update = update
        , view   = view
    }

init =
    { num1=0 }
  
type Msg = Ins Int | Square | Reset | CE

insertNum num model =
    model * 10 + num

update msg model =
    case msg of
        Ins num ->
            { model | num1 = insertNum num (.num1 model) }
        Square ->
            { model | num1 = (.num1 model)^2 }
        Reset ->
            { model | num1 = 0 }
        CE ->
            { model | num1 = (.num1 model) // 10 }
      

view model =
    div []
        [ 
            div [] [ text "My Calculator" ]
            , div [] [ text (String.fromInt (.num1 model)) ]
            , div [] [
                button [ onClick (Ins 1) ] [ text "1" ]
                , button [ onClick (Ins 2) ] [ text "2" ]
                , button [ onClick (Ins 3) ] [ text "3" ]
                ]
            , div [] [
                button [ onClick (Ins 4) ] [ text "4" ]
                , button [ onClick (Ins 5) ] [ text "5" ]
                , button [ onClick (Ins 6) ] [ text "6" ]
                ]
            , div [] [
                button [ onClick (Ins 7) ] [ text "7" ]
                , button [ onClick (Ins 8) ] [ text "8" ]
                , button [ onClick (Ins 9) ] [ text "9" ]
                ]
            , div [] [
                button [ onClick Square ] [ text "sq" ]
                , button [ onClick Reset ] [ text "reset" ]
                ]
            , div [] [
                button [ onClick CE ] [ text "CE" ]
                ]
        ]
