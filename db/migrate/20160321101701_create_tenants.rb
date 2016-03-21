class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
    	t.references :crib, index: true, foreign_key: true
    	t.string :name
    	t.integer :age
    	t.string :email

      t.timestamps null: false
    end
  end
end
