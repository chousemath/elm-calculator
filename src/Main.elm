import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
    Browser.sandbox {
        init     = { num1=0 }
        , update = update
        , view   = view
    }

  
type Msg = Ins0 | Ins1 | Ins2 | Ins3 | Ins4 | Ins5 | Ins6 | Ins7 | Ins8 | Ins9 | Square | Reset | CE

insertNum num model =
    model * 10 + num

update msg model =
    case msg of
        Ins0 ->
            { model | num1 = insertNum 0 (.num1 model) }
        Ins1 ->
            { model | num1 = insertNum 1 (.num1 model) }
        Ins2 ->
            { model | num1 = insertNum 2 (.num1 model) }
        Ins3 ->
            { model | num1 = insertNum 3 (.num1 model) }
        Ins4 ->
            { model | num1 = insertNum 4 (.num1 model) }
        Ins5 ->
            { model | num1 = insertNum 5 (.num1 model) }
        Ins6 ->
            { model | num1 = insertNum 6 (.num1 model) }
        Ins7 ->
            { model | num1 = insertNum 7 (.num1 model) }
        Ins8 ->
            { model | num1 = insertNum 8 (.num1 model) }
        Ins9 ->
            { model | num1 = insertNum 9 (.num1 model) }
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
                button [ onClick Ins1 ] [ text "1" ]
                , button [ onClick Ins2 ] [ text "2" ]
                , button [ onClick Ins3 ] [ text "3" ]
                ]
            , div [] [
                button [ onClick Ins4 ] [ text "4" ]
                , button [ onClick Ins5 ] [ text "5" ]
                , button [ onClick Ins6 ] [ text "6" ]
                ]
            , div [] [
                button [ onClick Ins7 ] [ text "7" ]
                , button [ onClick Ins8 ] [ text "8" ]
                , button [ onClick Ins9 ] [ text "9" ]
                ]
            , div [] [
                button [ onClick Square ] [ text "sq" ]
                , button [ onClick Reset ] [ text "reset" ]
                ]
            , div [] [
                button [ onClick CE ] [ text "CE" ]
                ]
        ]
