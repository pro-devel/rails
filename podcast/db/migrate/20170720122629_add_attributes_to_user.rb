class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :description, :text
    add_column :users, :itunes, :string
    add_column :users, :stitcher, :string
    add_column :users, :podbay, :string
  end
end
