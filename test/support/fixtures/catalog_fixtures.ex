defmodule LiveviewUploadsRedirectIssue.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewUploadsRedirectIssue.Catalog` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        image_upload: "some image_upload",
        name: "some name"
      })
      |> LiveviewUploadsRedirectIssue.Catalog.create_image()

    image
  end
end
