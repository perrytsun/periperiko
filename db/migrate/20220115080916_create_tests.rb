class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :user_name
      t.string :post_name
      t.text :body

      t.timestamps
    end
  end
end
