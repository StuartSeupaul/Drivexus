class Game < ActiveRecord::Base

def self.get_class_for_game_result(scantrons)
  scantrons.where(game_name: 'redlight').where(user_id: current_user.id).first
end

end
