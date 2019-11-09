class Task < ApplicationRecord
  def self.csv_attributes
    ["name", "description", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{|attr| task.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      task = new
      task.attributes = row.to_hash.slice(*csv_attributes)
      task.save!
    end
  end

private

  has_one_attached :image
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackableassociations(auth_object = nil)
    []
  end
end
