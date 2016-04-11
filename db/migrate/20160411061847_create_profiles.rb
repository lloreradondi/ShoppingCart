class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_unique_id
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
