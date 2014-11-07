class AddMore < ActiveRecord::Migration
  def change
  	add_column :locations, :zip_code, :integer
  	add_column :locations, :street, :string
  	add_column :locations, :description, :text
  	add_column :locations, :city, :string
  	add_column :locations, :lat, :string
  	add_column :locations, :long, :string
  end
end
