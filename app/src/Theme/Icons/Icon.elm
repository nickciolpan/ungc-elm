module Theme.Icons.Icon exposing (Icon, Size(..), getName, icon, view)

import Color as RawColor
import Html exposing (Html, div)
import Theme.Color exposing (Color, color, getColor)
import Theme.Icons.Logo as LogoIcon
import Theme.Icons.Menu as MenuIcon


type alias IconStyle =
    { name : String }


type Size
    = XS
    | S
    | M
    | L


type Icon
    = Logo IconStyle
    | Menu IconStyle


type alias IconTheme =
    { logo : Icon
    , menu : Icon
    }


icon : IconTheme
icon =
    { logo =
        Logo
            { name = "Logo"
            }
    , menu =
        Menu
            { name = "Menu"
            }
    }


getName : Icon -> String
getName i =
    case i of
        Logo v ->
            v.name

        Menu v ->
            v.name


getSize : Size -> Int
getSize size =
    case size of
        XS ->
            24

        S ->
            32

        M ->
            64

        L ->
            128


view : Color -> Icon -> Size -> Html msg
view color i size =
    let
        c =
            RawColor.toCssString (getColor color)
    in
    case i of
        Logo _ ->
            LogoIcon.view c (getSize size)

        Menu _ ->
            MenuIcon.view c (getSize size)
