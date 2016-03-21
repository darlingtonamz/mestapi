class CreateCribs < ActiveRecord::Migration
  def change
    create_table 	:cribs do |t|
    	t.references :owner, index: true, foreign_key: true
    	t.string 	:name
    	t.integer 	:length
    	t.integer 	:bredth
    	t.string 	:location
      	t.timestamps null: false

    end
  end
end
