class Score < ActiveRecord::Base
  after_initialize :init
  def init
    self.score ||= 0
  end
end