class AddToPwnds < ActiveRecord::Migration
  def change
    add_column :pwnds, :email, :string
    add_column :pwnds, :lastcontact, :datetime
    add_column :pwnds, :optout, :boolean, default: false

  end
end
