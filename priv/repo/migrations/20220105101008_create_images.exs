defmodule LiveviewUploadsRedirectIssue.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :name, :string
      add :image_upload, :string

      timestamps()
    end
  end
end
