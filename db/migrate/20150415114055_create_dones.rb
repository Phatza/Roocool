class CreateDones < ActiveRecord::Migration
  def change
  	create_table :dones do |t|
  		t.string :pseudo
  		t.string :message
  		t.timestamps
  	end
  end
end
