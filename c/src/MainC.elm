module MainC exposing (main)

import Browser
import MainA exposing (thisIsUsedByC)


main =
    Browser.sandbox
        { init = ()
        , update = \_ _ -> ()
        , view = always thisIsUsedByC
        }
