class AddEmailConfirmColumnToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :confirm_token, :string
  end
end
