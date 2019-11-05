class Task < ApplicationRecord
  has_one_attached :image
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackableassociations(auth_object = nil)
    []
  end
end
