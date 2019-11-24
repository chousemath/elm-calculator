module Main exposing (Msg(..), Receipt, init, insertNum, main, update, view)

import Browser
import Html exposing (Attribute, Html, button, div, input, li, text, ul)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Random


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Receipt =
    { name : String
    , price : Int
    , id : Int
    }


init =
    { price = 0
    , counter = 0
    , name = ""
    , receipts = []
    }


type Msg
    = Ins Int
    | Square
    | Sign
    | Reset
    | CE
    | SetCustomerName String
    | SaveReceipt Receipt
    | DestroyReceipt Int


insertNum num model =
    model * 10 + num


genReceipt : String -> Int -> Int -> Receipt
genReceipt name price counter =
    Receipt name price (counter + 1)


formatReceipt : Receipt -> String
formatReceipt receipt =
    "Customer: " ++ receipt.name ++ ", price: ₩" ++ String.fromInt receipt.price


update msg model =
    case msg of
        Sign ->
            { model | price = -model.price }

        Ins num ->
            { model | price = insertNum num model.price }

        Square ->
            { model | price = model.price ^ 2 }

        Reset ->
            { model | price = 0 }

        CE ->
            { model | price = model.price // 10 }

        SetCustomerName name ->
            { model | name = name }

        SaveReceipt receipt ->
            { model
                | receipts = receipt :: model.receipts
                , name = ""
                , price = 0
                , counter = model.counter + 1
            }

        DestroyReceipt id ->
            { model | receipts = List.filter (\receipt -> receipt.id /= id) model.receipts }


view model =
    div []
        [ div [] [ text "My Calculator" ]
        , input [ placeholder "Customer name", value model.name, onInput SetCustomerName ] []
        , div [] [ text ("₩ " ++ String.fromInt model.price) ]
        , div []
            [ button [ onClick (Ins 1) ] [ text "1" ]
            , button [ onClick (Ins 2) ] [ text "2" ]
            , button [ onClick (Ins 3) ] [ text "3" ]
            ]
        , div []
            [ button [ onClick (Ins 4) ] [ text "4" ]
            , button [ onClick (Ins 5) ] [ text "5" ]
            , button [ onClick (Ins 6) ] [ text "6" ]
            ]
        , div []
            [ button [ onClick (Ins 7) ] [ text "7" ]
            , button [ onClick (Ins 8) ] [ text "8" ]
            , button [ onClick (Ins 9) ] [ text "9" ]
            ]
        , div []
            [ button [ onClick Square ] [ text "sq" ]
            , button [ onClick Reset ] [ text "reset" ]
            ]
        , div []
            [ button [ onClick Sign ] [ text "+/-" ]
            ]
        , div []
            [ button [ onClick CE ] [ text "CE" ]
            ]
        , div []
            [ button [ onClick (SaveReceipt (genReceipt model.name model.price model.counter)) ] [ text "Save Receipt" ]
            ]
        , ul [] (List.map (\receipt -> li [ onClick (DestroyReceipt receipt.id) ] [ text (formatReceipt receipt) ]) model.receipts)
        ]
