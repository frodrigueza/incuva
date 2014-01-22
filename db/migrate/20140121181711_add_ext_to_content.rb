class AddExtToContent < ActiveRecord::Migration
  def change
  	add_column :contents, :extension, :string
  end
end