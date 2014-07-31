class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.float 			:score
      t.string      :content
      t.belongs_to  :user
      t.belongs_to  :party

      t.timestamps
    end
  end
end
