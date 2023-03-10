defmodule ExProjectoWeb.PageJSON do
  def render("list.json", assigns) do
    %{users: Enum.map(assigns.users, fn u -> user(u) end), timestamp: assigns.timestamp}
  end

  def user(user) do
    %{id: user.id, points: user.points}
  end
end
