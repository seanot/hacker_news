class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
   
      t.text :content
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps
    end
  end
end
