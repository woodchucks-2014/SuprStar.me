class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.float 			:score, default: 0
      t.string      :content
      t.belongs_to  :party
      t.belongs_to  :user

      t.timestamps
    end
  end
end
