class AddUserIdColumnToForecasts < ActiveRecord::Migration
  def change
    add_reference :forecasts, :user, index: true
  end
end
