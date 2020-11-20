class Service < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :description, type: :text, analyzer: :english
    end
  end
  
  def self.search(query)
    __elasticsearch__.search(
    {
      query: {
         multi_match: {
           query: query,
           fields: [:name]
         }
       },
       # more blocks will go IN HERE. Keep reading!
    })
  end

  belongs_to :company
  has_many :users, through: :orders
end
