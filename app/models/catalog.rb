class Catalog < ApplicationRecord
  validates :title, presence: true
  has_many :movies, dependent: :destroy

  def self.getAll
    self.order('created_at desc').all.map do |catalog|
      {
          count: catalog.movies.count
      }.merge(catalog.as_json)
    end
  end

  def self.findOne(id)
    {**self.find(id).as_json, count: self.find(id).movies.count}
  end
end
