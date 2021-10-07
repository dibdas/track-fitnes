class AddExerciseToMeasurement < ActiveRecord::Migration[6.1]
    def change
      add_reference :measurements, :exercise, null: false, foreign_key: true
    end
  end