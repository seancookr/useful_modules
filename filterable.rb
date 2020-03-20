module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end

# /products?status=status&location=location&starts_with=starts_with
#def index
  #@products = Product.filter(params.slice(:status, :location, :starts_with))
#end

#class Product < ActiveRecord::Base
  #include Filterable

  #scope :status, -> (status) { where status: status }
  #scope :location, -> (location_id) { where location_id: location_id }
  #scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
#end
