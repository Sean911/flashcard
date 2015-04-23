class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer "user_id"
      t.integer "word_id"
      t.integer "score", default: 0
      t.timestamps null: false
    end
  end
end
