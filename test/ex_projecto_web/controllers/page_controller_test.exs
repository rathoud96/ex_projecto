defmodule ExProjectoWeb.PageControllerTest do
  use ExProjectoWeb.ConnCase

  alias ExProjecto.Users

  describe "get users" do
    setup [:create_users]

    test "GET /", %{conn: conn} do
      conn = get(conn, ~p"/")
      assert %{"timestamp" => _, "users" => _} = json_response(conn, 200)
    end
  end

  defp create_users(_) do
    for _i <- 1..100 do
      user = Users.create()
    end

    {:ok, state} = ExProjecto.init(%{})
    # :timer.sleep(60 * 1000)
    users = Users.get_all(state.min_number)
    %{users: users}
  end
end
