defmodule CinderQueryBugReproWeb.MyResourceLive.Index do
  use CinderQueryBugReproWeb, :live_view

  alias CinderQueryBugRepro.MyDomain.MyResource

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Listing My resources
      </.header>

      <Cinder.Table.table
        resource={MyResource}
        id="my_resources"
      >
        <:col :let={my_resource} field="number" filter sort>{my_resource.number}</:col>
        <:col :let={my_resource} field="is_active" filter sort>{my_resource.is_active}</:col>
      </Cinder.Table.table>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:page_title, "Listing My resources")}
  end
end
