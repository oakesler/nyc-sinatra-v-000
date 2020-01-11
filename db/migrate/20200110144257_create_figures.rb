class CreateFigures < ActiveRecord::Migration
   def change 
    create_table :figures do |t|
      t.string :name
      t.string :landmark_ids
      t.string :title_ids
    end
  end
end
