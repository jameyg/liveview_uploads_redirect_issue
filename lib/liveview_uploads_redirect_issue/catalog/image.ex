defmodule LiveviewUploadsRedirectIssue.Catalog.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :image_upload, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:name, :image_upload])
    |> validate_required([:name, :image_upload])
  end
end
