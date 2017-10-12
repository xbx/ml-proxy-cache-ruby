class Item
    include Dynamoid::Document

    field :ml_id
    field :thumbnail
    field :title
    field :hit_counter, :integer
  
end
