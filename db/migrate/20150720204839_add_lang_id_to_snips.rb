class AddLangIdToSnips < ActiveRecord::Migration
  def change
    add_reference :snips, :language, index: true, foreign_key: true
  end
end
