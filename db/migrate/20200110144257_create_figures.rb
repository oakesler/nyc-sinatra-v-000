class CreateFigures < ActiveRecord::Migration
   def up
    create_table :figures do |t|
      t.string :name
      t.string :landmark_ids
      t.string :title_ids
    end
  end
  
  def down
    drop_table :figures
  end
end
