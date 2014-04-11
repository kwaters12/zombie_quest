class Plant < ActiveRecord::Base
  def hungry?
    true
  end

  def dummy?
    iq < 3
  end

  def genius?
    iq >= 3
  end
end
