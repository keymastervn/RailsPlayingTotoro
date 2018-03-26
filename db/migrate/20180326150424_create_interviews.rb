class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.belongs_to :developer, index: true
      t.integer :score

      t.timestamps
    end

    # add_index :interviews, :developer_id
  end
end
