class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      # by default an id column is added
      t.string :title
      t.text :body

      # defines two additional columns created_at and updated_at
      t.timestamps
    end
  end
end
