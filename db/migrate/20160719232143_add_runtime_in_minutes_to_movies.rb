class AddRuntimeInMinutesToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :runtime_in_minutes, :integer
  end
end
