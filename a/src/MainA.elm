module MainA exposing (thisIsUsedByC, thisIsUsedByBandC)

import Html exposing (Html, text)

thisIsUsedByC : Html msg
thisIsUsedByC =
    text "this is used C"

thisIsUsedByBandC : Html msg
thisIsUsedByBandC =
    text "this is used by B and C"


