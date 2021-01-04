module MainB exposing (main)

import Browser
import MainA exposing (thisIsUsedByB)


main =
    Browser.sandbox
        { init = ()
        , update = \_ _ -> ()
        , view = always thisIsUsedByB
        }
