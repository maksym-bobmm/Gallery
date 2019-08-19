class Log < ApplicationRecord
  belongs_to :user
  belongs_to :action

  ransacker :by_log,
    :formatter => {}
 do |parent|

  end
end
