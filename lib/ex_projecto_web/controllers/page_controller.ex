defmodule ExProjectoWeb.PageController do
  use ExProjectoWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    {:ok, response} = ExProjecto.get_users()

    conn
    |> put_status(:ok)
    |> render( "list.json", users: response.users, timestamp: response.timestamp)
  end
end
