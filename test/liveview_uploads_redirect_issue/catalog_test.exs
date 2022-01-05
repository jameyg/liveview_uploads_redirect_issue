defmodule LiveviewUploadsRedirectIssue.CatalogTest do
  use LiveviewUploadsRedirectIssue.DataCase

  alias LiveviewUploadsRedirectIssue.Catalog

  describe "images" do
    alias LiveviewUploadsRedirectIssue.Catalog.Image

    import LiveviewUploadsRedirectIssue.CatalogFixtures

    @invalid_attrs %{image_upload: nil, name: nil}

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Catalog.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Catalog.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      valid_attrs = %{image_upload: "some image_upload", name: "some name"}

      assert {:ok, %Image{} = image} = Catalog.create_image(valid_attrs)
      assert image.image_upload == "some image_upload"
      assert image.name == "some name"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      update_attrs = %{image_upload: "some updated image_upload", name: "some updated name"}

      assert {:ok, %Image{} = image} = Catalog.update_image(image, update_attrs)
      assert image.image_upload == "some updated image_upload"
      assert image.name == "some updated name"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_image(image, @invalid_attrs)
      assert image == Catalog.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Catalog.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Catalog.change_image(image)
    end
  end
end
