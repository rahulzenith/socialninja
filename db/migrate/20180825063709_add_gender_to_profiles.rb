class AddGenderToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :gender, :string
  end
end
