defmodule ExProjecto do
  @moduledoc """
  ExProjecto keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  use GenServer

  alias ExProjecto.Users

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    schedule_for_every(1 * 60 * 1000)# In 1 minute
    {:ok, %{min_number: Enum.random(0..100), timestamp: nil}}
  end

  def handle_info(:update_point, state) do
    users = Users.all()
    Enum.map(users, fn user -> Users.update_points(user, Enum.random(0..100)) end)
    {:noreply, Map.put(state, :min_number, Enum.random(0..100))}
  end

  def handle_call(:get_users, _from, state) do
    users = Users.get_all(state.min_number)
    {:reply, {:ok, %{users: users, timestamp: state.timestamp}}, Map.put(state, :timestamp, DateTime.utc_now() |> to_string())}
  end

  defp schedule_for_every(time) do
    Process.send_after(self(), :update_point, time)
  end

  #Client Calls

  def get_users do
    GenServer.call(__MODULE__, :get_users)
  end
end
