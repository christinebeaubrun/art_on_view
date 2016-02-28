class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string 			:name
      t.string 			:exhibit_date
      t.string 			:img_url
      t.string 			:about_info
      t.belongs_to	:museum, index: true

      t.timestamps null: false
    end
  end
end
