class Item
    include Dynamoid::Document

    field :ml_id
    field :detail, :raw    
  
end
