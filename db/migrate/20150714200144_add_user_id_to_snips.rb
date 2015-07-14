class AddUserIdToSnips < ActiveRecord::Migration
  def change
    add_reference :snips, :user, index: true, foreign_key: true
  end
end
