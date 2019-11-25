class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.belongs_to :user, null: false
      
      # 카테고리 설정
      t.belongs_to :category, null: false

      # 상품 필드 목록
      t.string :image
      t.string :title, null: false
      t.integer :price, null: false
      t.text :description

      # 차량용 필드 추가(차량 외 카테고리는 디폴트값 부여)
      t.integer :mileage, default: 0
      t.integer :caryear, default: 0
      t.boolean :smokingOptions, default: false
      t.timestamps
    end
  end
end
