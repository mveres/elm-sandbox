import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String

main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = {
  name : String,
  password : String,
  passwordAgain : String,
  validationInfo: (String, String)
}


model : Model
model = Model "" "" "" ("", "")


-- UPDATE

type Msg =
    Name String
    | Password String
    | PasswordAgain String
    | Validate


validate model =
  if ((String.length model.password) < 8) then
    ("red", "Password should have at least 8 characters")
  else if model.password == model.passwordAgain then
    ("green", "OK")
  else
    ("red", "Passwords do not match!")

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

    Validate -> { model | validationInfo = (validate model) }



-- VIEW

view : Model -> Html Msg
view model =
  div []
    [
      input [ type' "text", placeholder "Name", onInput Name ] [],
      input [ type' "password", placeholder "Password", onInput Password ] [],
      input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] [],
      button [ onClick Validate ] [ text "Submit" ],
      let (color, message) = model.validationInfo
      in div [ style [("color", color)] ] [ text message ]
    ]
