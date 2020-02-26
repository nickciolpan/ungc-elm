module Main exposing (main)

import Components.Button.Stories as Button
import Components.Header.Stories as Header
import Guidelines.Colors as ColorGuide
import Html
import Html.Attributes exposing (style)
import UIExplorer exposing (UIExplorerProgram, category, createCategories, defaultConfig, exploreWithCategories, logoFromUrl, storiesOf)
import UIExplorer.Plugins.MenuVisibility as MenuVisibility


config =
    { defaultConfig
        | menuViewEnhancer = MenuVisibility.menuViewEnhancer
        , customHeader =
            Just
                { title = "United Nations Global Compact"
                , logo = logoFromUrl "ungc.png"
                , titleColor = Nothing
                , bgColor = Nothing
                }
    }


main : UIExplorerProgram {} () { hasMenu : Bool }
main =
    exploreWithCategories
        config
        (createCategories
            |> category "Components"
                [ Button.stories
                , Header.stories
                ]
        )
