module View exposing (view)

import Html exposing (text)
import List


view : Html.Html msg
view =
    text "imported text from another module"


demo : List a -> Bool
demo list =
    List.isEmpty list
