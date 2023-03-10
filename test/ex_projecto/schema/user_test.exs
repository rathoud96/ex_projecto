defmodule ExProjecto.UserTest do
  use ExProjectoWeb.ConnCase

  alias ExProjecto.Schema.User

  test "changeset with valid attrs" do
    changeset = User.changeset(%User{})
    assert changeset.valid?
  end

  test "changeset with invalid attrs" do
    changeset = User.changeset(%User{}, %{points: 101})
    refute changeset.valid?
  end
end
