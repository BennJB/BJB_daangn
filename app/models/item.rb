class Item < ApplicationRecord
    mount_uploader :image, ImageUploader

    paginates_per 10
    is_impressionable counter_cache: true, unique: true
    
    belongs_to :user
    belongs_to :category
    validates :user_id, presence: true
    validates :category_id, presence: true
    
    validates :title, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000, only_integer: true }
    validates :image, presence: true
    
    # 추가 폼은 필수로 입력(웹 과제 명시사항), 저장 제대로 안되면 rollback 에러
    validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000, only_integer: true }
    validates :caryear, presence: true
    
    # 흡연여부는 boolean type이라서 따로 설정
    validates :smokingOptions, inclusion: { in: [true, false] }
    validates :smokingOptions, exclusion: { in: [nil] }
    

end
