class Addwords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string   "name",       null: false
      t.text     "definition", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "list_id", null: false
    end
  end
end
