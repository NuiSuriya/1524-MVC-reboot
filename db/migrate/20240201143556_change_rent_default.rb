class ChangeRentDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :books, :rent, from: true, to: false
  end
end
