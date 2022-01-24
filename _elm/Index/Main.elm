port module Index.Main exposing (..)

import Browser
import Html exposing (Html, button, div, node, text)
import Html.Attributes exposing (class, classList, id)
import Html.Events exposing (onClick)



-- CSS


moduleCSS : String
moduleCSS =
    """
#darkModeToggle * {
  box-sizing: border-box;
}

#darkModeToggle #background {
  background-color: grey;
  height: 3rem;
  width: 4.5rem;
  border-radius: 1.5rem;
  position: relative;
}

#darkModeToggle #circle {
  height: 3rem;
  position: absolute;
  width: 3rem;
  border-radius: 1.5rem;
  border: solid 2px black;


  transition: left 0.5s, background-color 0.5s, content 0.5s;
}

#darkModeToggle .left {
  left: 0;
  background-color: blue;
  position: relative;
}

#darkModeToggle .left::after {
  position: absolute;
  content: "🌙";
  top: 0.15rem;
  margin-left: 0.5rem;
}

#darkModeToggle .right {
  left: 1.5rem;
  background-color: yellow;
  position: relative;
}

#darkModeToggle .right::after {
  position: absolute;
  content: "☀️";
  top: 0.15rem;
  margin-left: 0.5rem;
}
"""



-- MAIN


main : Program Flag Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { darkModeEnabled : Bool }


type alias Flag =
    Model


init : Flag -> ( Model, Cmd Msg )
init flag =
    ( { darkModeEnabled = flag.darkModeEnabled }
    , Cmd.none
    )



-- UPDATE


type Msg
    = ToggleDarkMode


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleDarkMode ->
            let
                darkModeEnabled =
                    if model.darkModeEnabled then
                        False

                    else
                        True
            in
            ( { model | darkModeEnabled = darkModeEnabled }, toggleDarkMode darkModeEnabled )



-- VIEW


view : Model -> Html Msg
view model =
    div [ id "darkModeToggle" ]
        [ node "style" [] [ text moduleCSS ]
        , div [ id "background", onClick ToggleDarkMode ]
            [ div [ id "circle", classList [ ( "left", model.darkModeEnabled ), ( "right", not model.darkModeEnabled ) ] ] [ text "" ] ]
        ]



-- SUBSCRIPTIONS


port toggleDarkMode : Bool -> Cmd msg


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
