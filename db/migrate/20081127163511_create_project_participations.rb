class CreateProjectParticipations < ActiveRecord::Migration
  def self.up
    create_table :project_participations do |t|
      t.integer :project_id
      t.integer :person_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_participations
  end
end
