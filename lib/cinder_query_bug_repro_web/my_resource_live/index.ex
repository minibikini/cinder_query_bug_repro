defmodule CinderQueryBugReproWeb.MyResourceLive.Index do
  use CinderQueryBugReproWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Listing My resources
      </.header>

      <.table
        id="my_resources"
        rows={@streams.my_resources}
      >
        <:col :let={{_id, my_resource}} label="Id">{my_resource.id}</:col>

        <:col :let={{_id, my_resource}} label="Number">{my_resource.number}</:col>

        <:col :let={{_id, my_resource}} label="Is active">{my_resource.is_active}</:col>
      </.table>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Listing My resources")
     |> stream(:my_resources, Ash.read!(CinderQueryBugRepro.MyDomain.MyResource))}
  end
end
