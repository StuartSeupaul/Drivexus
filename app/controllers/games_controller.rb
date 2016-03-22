class GamesController < ApplicationController

  def redlight
    if Scantron.where(user_id: current_user).where(game_name: 'redlight').first
      @scantron = Scantron.where(user_id: current_user.id).where(game_name: 'redlight').first
    else
      @scantron = Scantron.create(user_id: current_user.id, game_name: 'redlight')
    end
  end

end
