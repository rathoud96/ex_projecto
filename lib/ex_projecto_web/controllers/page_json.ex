defmodule ExProjectoWeb.PageJSON do
  def list(%{users: users, timestamp: timestamp}) do
    %{users: for(user_data <- users, do: user(user_data)), timestamp: timestamp}
  end

  def render("list.json", assigns) do
    %{users: Enum.map(assigns.users, fn u -> user(u) end), timestamp: assigns.timestamp}
  end

  def user(user) do
    %{id: user.id, points: user.points}
  end
end
