class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|

      # 카테고리 제목
      t.string :title
      
      t.timestamps
    end
  end
end
