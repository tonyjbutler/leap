class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string   :forename
      t.string   :surname
      t.string   :middle_names
      t.string   :address
      t.string   :town
      t.string   :postcode
      t.string   :mobile_number
      t.string   :next_of_kin
      t.date     :date_of_birth
      t.integer  :uln
      t.string   :mis_id, :null => :false
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
