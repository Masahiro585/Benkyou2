class Task < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackableassociations(auth_object = nil)
    []
  end
end
