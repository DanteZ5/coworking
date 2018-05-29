class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :bio
      t.string :status, default: "unconfirmed"

      t.timestamps
    end
  end
end
