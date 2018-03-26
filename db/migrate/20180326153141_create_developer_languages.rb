class CreateDeveloperLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developers_languages do |t|
      t.belongs_to :developer, index: false
      t.belongs_to :language, index: false
      t.timestamps
    end

    add_index :developers_languages, :developer_id, {name: 'idx_dev_lang_on_dev_id'}
    add_index :developers_languages, :language_id, {name: 'idx_dev_lang_on_lang_id'}
  end
end
