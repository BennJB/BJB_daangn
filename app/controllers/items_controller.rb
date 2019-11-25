class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :detail]
    impressionist actions: [:index, :detail], unique: [:impressionable_id, :ip_address]

    # 전체상품 표시
    def index
        @items = Item.order(id: :desc).page(params[:page])
    end
        
    def detail
        @item = Item.find(params[:id])
        if @item.smokingOptions == true
            @smoking = '흡연자'
        else
            @smoking = '비흡연자'
        end
    end

    def item_create
        # 메인페이지에서는 카테고리 id를 받지 않는다.
        if params[:id].present?
            @categories = Category.find(params[:id])
            @item = Item.new
        else 
            @item = Item.new
        end    
    end
    
    def create
        @item = Item.new(item_params)
        @item.user = current_user
        if @item.save
            redirect_to '/'
        else                      
            flash[:errors] = @item.errors.full_messages
            redirect_to '/new'   
        end     
    end

    private 
    def item_params
        # 폼 파라미터에서 자꾸 "mileage" =>"" 형태로 params에 들어와서 얘만 따로 디폴트 조건문 삽입   
        if params[:item][:mileage].blank?
            params.require(:item).permit(:title, :price, :description, :caryear, :smokingOptions, :category_id, :image, :image_cache)
        else    
            params.require(:item).permit(:title, :price, :description, :caryear, :mileage, :smokingOptions, :category_id, :image, :image_cache)
        end
    end
end
    