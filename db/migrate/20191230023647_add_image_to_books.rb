class AddImageToBooks < ActiveRecord::Migration[5.2]
  def up
    add_column :books, :image, :string
  end

  def down
    remove_column :books, :image, :string
  end
end
