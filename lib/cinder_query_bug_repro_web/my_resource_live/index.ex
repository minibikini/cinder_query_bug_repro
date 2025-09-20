defmodule CinderQueryBugReproWeb.MyResourceLive.Index do
  use CinderQueryBugReproWeb, :live_view
  require Ash.Query

  alias CinderQueryBugRepro.MyDomain.MyResource

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Listing All
      </.header>

      <Cinder.Table.table resource={MyResource}>
        <:col :let={my_resource} field="number" sort>{my_resource.number}</:col>
        <:col :let={my_resource} field="is_active" sort>{my_resource.is_active}</:col>
      </Cinder.Table.table>

      <.header>
        Listing with<br />
        <code class="text-primary">
          query_opts=&lbrace;[filter: [is_active: true], sort: :number]}
        </code>
      </.header>

      <Cinder.Table.table
        resource={MyResource}
        id="my_resources_active"
        query_opts={[filter: [is_active: true], sort: :number]}
      >
        <:col :let={my_resource} field="number" sort>{my_resource.number}</:col>
        <:col :let={my_resource} field="is_active" sort>{my_resource.is_active}</:col>
      </Cinder.Table.table>

      <.header>
        Listing with:<br />
        <code class="text-primary">
          query=&lbrace;MyResource |> Ash.Query.filter(is_active: true) |> Ash.Query.sort(:number)}
        </code>
      </.header>

      <Cinder.Table.table
        query={MyResource |> Ash.Query.filter(is_active: true) |> Ash.Query.sort(:number)}
        id="my_resources_query_direct"
      >
        <:col :let={my_resource} field="number" sort>{my_resource.number}</:col>
        <:col :let={my_resource} field="is_active" sort>{my_resource.is_active}</:col>
      </Cinder.Table.table>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:page_title, "Listing My resources")}
  end
end
