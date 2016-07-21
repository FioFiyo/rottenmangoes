class RemoveRuntimeInMinutesFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :runtime_in_minutes, :string
  end
end
