class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :location
      t.float :latitude
      t.float :longitude
      t.text :api_data

      t.timestamps
    end
  end
end
