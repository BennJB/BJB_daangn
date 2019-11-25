class CategoriesController < ApplicationController
    
     # 해당 카테고리의 상품 나열
    def categorized_index
        if params[:query_1].nil?
            if params[:id] == "hot_deal"
                @categories = nil
                @items = Item.order("impressions_count DESC").page(params[:page])
            else
                @categories = Category.find(params[:id])
                @items = @categories.items.order(id: :desc).page(params[:page])
            end                
        else  
            @categories = Category.find(params[:id])
            # 필터에서 파라미터로 {"query" => "2010, 2020"} 으로 전달 되기 때문에, value를 각각 분리해준다.
            # 그리고 caryear은 integer 값이기 때문에, split("문자열")에서 숫자로 abc.map(&to_i) 바꿔줘야 한다.
            # 위에 코드에 .map()까지 붙여서 출력하면 [2012, 2015]처럼 안나오고, 레코드 형태로 출력된다.
            @caryear_str = params[:query_1].split(",")
            @caryear_int = @caryear_str.map(&:to_i)
            
            @mileage_str = params[:query_2].split(",")
            @mileage_int = @mileage_str.map(&:to_i)
            
            # 흡연 여부에 따라 string으로 넘어온 값을 boolean으로 형변환
            if params[:query_3] == "true"
                @smokingOptions = !!(params[:query_3])
                @smoking = "흡연"
            else
                @smokingOptions = !(params[:query_3])
                @smoking = "비흡연"
            end    
            @items = @categories.items.where({mileage: [@mileage_int[0]..@mileage_int[1]], caryear: [@caryear_int[0]..@caryear_int[1]], smokingOptions: @smokingOptions }).order(id: :desc).page(params[:page]) 
        end 
    end

end    
