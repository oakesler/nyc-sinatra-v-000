class CreateLandmarks < ActiveRecord::Migration
  #raise 'Write CreateLandmarks migration here'
  def up
    create_table :landmarks do |t|
      t.string :name
      t.string :figure_id
      t.string :year_completed
    end
  end
  
  def down
    drop_table :landmarks
  end
end
