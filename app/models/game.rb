class Game < ActiveRecord::Base

def self.get_class_for_game_result(scantrons, current_user_id)
  if scantrons.where(game_name: 'redlight').where(user_id: current_user_id).first
    scantron = scantrons.where(game_name: 'redlight').where(user_id: current_user.id).first
    if scantron.result == 1.0
      return "cohorts-exam-list-passed"
    else
      return "cohorts-exam-list-failed"
    end
  end
end

end
