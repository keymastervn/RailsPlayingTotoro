class CreateDeveloperProgrammingLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developers_programming_languages do |t|
      t.belongs_to :developer, index: false
      t.belongs_to :programming_language, index: false
      t.timestamps
    end

    add_index :developers_programming_languages, :developer_id, {name: 'idx_dev_prog_lang_on_dev_id'}
    add_index :developers_programming_languages, :programming_language_id, {name: 'idx_dev_prog_lang_on_prog_lang_id'}
  end
end
