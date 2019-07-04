class AddClientIdToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :client_id, :integer
  end
end
