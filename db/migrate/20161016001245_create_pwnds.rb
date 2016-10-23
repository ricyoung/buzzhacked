class CreatePwnds < ActiveRecord::Migration
  def change
    create_table :pwnds do |t|
      t.string :name
      t.string :title
      t.string :domain
      t.date :breachdate
      t.datetime :addeddate
      t.integer :pwncount
      t.text :description
      t.text :dataclass
      t.boolean :isverified
      t.boolean :issensitive
      t.boolean :isretired

      t.timestamps null: false
    end
  end
end
