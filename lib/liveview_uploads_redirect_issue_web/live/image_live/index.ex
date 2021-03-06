defmodule LiveviewUploadsRedirectIssueWeb.ImageLive.Index do
  use LiveviewUploadsRedirectIssueWeb, :live_view

  alias LiveviewUploadsRedirectIssue.Catalog
  alias LiveviewUploadsRedirectIssue.Catalog.Image

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :images, list_images())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Image")
    |> assign(:image, Catalog.get_image!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Image")
    |> assign(:image, %Image{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Images")
    |> assign(:image, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    image = Catalog.get_image!(id)
    {:ok, _} = Catalog.delete_image(image)

    {:noreply, assign(socket, :images, list_images())}
  end

  defp list_images do
    Catalog.list_images()
  end
end
