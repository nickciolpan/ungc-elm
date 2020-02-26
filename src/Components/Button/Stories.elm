module Components.Button.Stories exposing (stories)

import Color.Convert exposing (colorToHex)
import Components.Button.View as Button exposing (..)
import Css exposing (hex, rgb)
import Theme.Color exposing (color, getColor)
import UIExplorer exposing (storiesOf)


makeColor : Theme.Color.Color -> Css.Color
makeColor =
    getColor >> colorToHex >> Css.hex


config : Config
config =
    { defaultButtonConfig
        | theme =
            { primary = makeColor color.brand.primary
            , secondary = makeColor color.brand.alternative
            }
    }


stories : UIExplorer.UI a () { hasMenu : Bool }
stories =
    storiesOf
        "Button"
        [ ( "Primary", \_ -> Button.view "+ Create a new COP" { config | class = "" } (), { hasMenu = True } )
        , ( "Link", \_ -> Button.view "View All" { config | kind = Link, appearance = Secondary } (), { hasMenu = True } )
        , ( "GhostPrimary", \_ -> Button.view "Export Data" { config | kind = Ghost } (), { hasMenu = True } )
        , ( "GhostSecondary", \_ -> Button.view "Dashboard" { config | appearance = Secondary, kind = Ghost } (), { hasMenu = True } )
        ]
