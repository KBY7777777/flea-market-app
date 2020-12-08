class Card < ApplicationRecord

  belongs_to :user    #クレカ情報はuser_idのみへの連携

end


