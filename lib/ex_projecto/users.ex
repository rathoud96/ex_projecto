defmodule ExProjecto.Users do
  @moduledoc """
  Contains functions to interact with database
  """
  alias ExProjecto.Repo
  alias ExProjecto.Schema.User
  import Ecto.Query, only: [from: 2]

  def create do
    %User{}
    |> User.changeset()
    |> Repo.insert!()
  end

  #TODO use better function name
  @spec get_users(point::number) :: list(any())
  def get_users(point) do
    query =
      from u in User,
        where: u.points > ^point,
        select: u,
        limit: 2

    query |> Repo.all()
  end

  def all do
    Repo.all(User)
  end

  @spec update_points(user:: %User{}, point:: number) :: %User{}
  def update_points(user, point) do
    Repo.update!(User.changeset(user, %{points: point}))
  end
end
