defmodule ExProjectoWeb.PageController do
  use ExProjectoWeb, :controller

  def home(conn, _params) do
    {:ok, response} = ExProjecto.get_users()

    conn
    |> put_status(:ok)
    |> render(:list, users: response.users, timestamp: response.timestamp)
  end
end
