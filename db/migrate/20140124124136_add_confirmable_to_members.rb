class AddConfirmableToMembers < ActiveRecord::Migration
  def changestring
  	add_column :members, :confirmed_at, :datetime
  	add_column :members, :confirmation_sent_at, :datetime
  	add_column :members, :unconfirmed_email, :string
  end
end