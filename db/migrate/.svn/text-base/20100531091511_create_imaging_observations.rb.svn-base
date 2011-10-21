class CreateImagingObservations < ActiveRecord::Migration
  def self.up
    create_table :imaging_observations do |t|
      t.boolean :annotatorConfidence

      t.timestamps
    end
  end

  def self.down
    drop_table :imaging_observations
  end
end
