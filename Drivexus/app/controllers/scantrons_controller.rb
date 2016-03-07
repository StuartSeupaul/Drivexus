class ScantronsController < ApplicationController
  def create
    @scantron = Scantron.build(scantron_params)

    if @scantron.save
      
    end
  end

  private

  def scantron_params
    params.require(:scantron).permit(:user_id, :exam_id)
  end
end
