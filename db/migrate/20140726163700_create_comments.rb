class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string      :content
      t.integer     :score
      t.belongs_to  :party
      t.belongs_to  :user

      t.timestamps
    end
  end
end
