class CreateDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :developers do |t|
      t.text :email, null: false

      t.timestamps
    end
  end
end
