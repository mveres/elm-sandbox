import Html exposing (Html, Attribute, div, input, text)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = { content: String, reversed: String }

model : Model
model = { content = "", reversed = "" }


-- UPDATE

type Msg = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent, reversed = (String.reverse newContent) }


-- VIEW
view: Model -> Html Msg
view model =
  div []
  [
    input [ placeholder "Text to reverse", onInput Change ] [],
    div [] [ text model.reversed ]
  ]
