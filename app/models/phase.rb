class Phase < ActiveRecord::Base
  has_many :projects

  def name
    name = super
    name.capitalize
  end
end
