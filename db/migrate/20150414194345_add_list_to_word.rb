class AddListToWord < ActiveRecord::Migration
  def change
    add_reference :words, :list, index: true, foreign_key: true
  end
end
