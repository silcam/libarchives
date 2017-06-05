class Password < ApplicationRecord

  def self.password
    Password.last.password
  end
end
