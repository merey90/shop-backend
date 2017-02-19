class CreateUserInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
      t.belongs_to :user, index: true, unique: true, foreign_key: true
      ## User Info
      t.string :name
      t.string :phone
      t.date   :birthdate
      t.string :image

      t.timestamps
    end
  end
end
