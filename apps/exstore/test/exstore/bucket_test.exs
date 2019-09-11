defmodule EXSTORE.BucketTest do
  use ExUnit.Case, async: true
  alias EXSTORE.Bucket

  # test product

  setup do
    bucket = start_supervised!(Bucket)

    %{
      bucket: bucket,
      productID: "9e30db68-4232-4cad-93f5-050858bbf131"
    }
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(EXSTORE.Bucket, []).restart == :temporary
  end

  test "store value by key", %{bucket: bucket, productID: productID} do
    assert Bucket.get(bucket, productID) == nil

    Bucket.put(bucket, productID, 3)
    assert Bucket.get(bucket, productID) == 3
  end

  test "delete value by key", %{bucket: bucket, productID: productID} do
    assert Bucket.get(bucket, productID) == nil
    Bucket.put(bucket, productID, 1)
    assert Bucket.get(bucket, productID) == 1

    Bucket.delete(bucket, productID)
    assert Bucket.get(bucket, productID) == nil
  end
end
