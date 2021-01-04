module MainA exposing (thisIsNeverUsed, thisIsUsedByB, thisIsUsedByC)

import Html exposing (Html, text)


thisIsUsedByB : Html msg
thisIsUsedByB =
    text "this is used by B"


thisIsUsedByC : Html msg
thisIsUsedByC =
    text "this is used by C"


thisIsNeverUsed : Html msg
thisIsNeverUsed =
    text "this is never used"
