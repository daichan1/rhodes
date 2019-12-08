class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :status
      t.text :gist
      t.text :impression

      t.timestamps
    end
  end
end
