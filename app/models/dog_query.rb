class DogQuery < ActiveRecord::Base
  belongs_to :dog
  belongs_to :user

  def counter
    if self.view_count.nil?
      self.view_count = 1
    else
      self.view_count += 1
    end
    self.save
  end

  def mark_match(fortune)
    self.is_match = true
    self.fortune = fortune
    self.save!
  end
end
