class RemoveIntegerFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :integer, :string
  end
end
