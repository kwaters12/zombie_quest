class Zombie < ActiveRecord::Base
  validates :name, presence: true
  has_many :tweets
  has_many :weapons

  def eat_brains
    self.iq += 3
    self.hungry = false
  end

  def dummy?
    iq < 3
  end

  def genius?
    iq >= 3
  end

  def craving
    if vegetarian
      'vegan brains'
    else 
      'brains'
    end
  end

  def swing(weapon)
    true
  end
end 
