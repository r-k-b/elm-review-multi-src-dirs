module MainB exposing (main)

import Browser
import MainA exposing (thisIsUsedByBandC)


main =
    Browser.sandbox
        { init = ()
        , update = \_ _ -> ()
        , view = always thisIsUsedByBandC
        }
