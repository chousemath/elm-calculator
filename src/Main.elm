import Browser
import Html exposing (Html, Attribute, button, div, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

main =
    Browser.sandbox {
        init     = init
        , update = update
        , view   = view
    }

init =
    { 
        num1 = 0
        , customerName = ""
    }
  
type Msg = Ins Int | Square | Reset | CE | SetCustomerName String

insertNum num model =
    model * 10 + num

update msg model =
    case msg of
        Ins num ->
            { model | num1 = insertNum num model.num1 }
        Square ->
            { model | num1 = model.num1^2 }
        Reset ->
            { model | num1 = 0 }
        CE ->
            { model | num1 = model.num1 // 10 }
        SetCustomerName name ->
            { model | customerName = name }
      

view model =
    div []
        [ 
            div [] [ text "My Calculator" ]
            , input [ placeholder "Customer name", value model.customerName, onInput SetCustomerName ] []
            , div [] [ text ("₩ " ++ String.fromInt (.num1 model)) ]
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
