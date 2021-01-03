module MainC exposing (main)

import Browser
import Html exposing (div)
import MainA exposing (thisIsUsedByBandC, thisIsUsedByC)


main =
    Browser.sandbox
        { init = ()
        , update = \_ _ -> ()
        , view = always <| div [] [ thisIsUsedByC, thisIsUsedByBandC ]
        }
