class AddPoiToLandmark < ActiveRecord::Migration[5.2]
  def change
    add_reference :landmarks, :poi, foreign_key: true
  end
end
