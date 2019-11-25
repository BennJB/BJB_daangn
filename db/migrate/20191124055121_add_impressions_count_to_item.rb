class AddImpressionsCountToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :impressions_count, :int
  end
end
