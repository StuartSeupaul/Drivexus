class ScantronsController < ApplicationController

  def create

    @scantron = Scantron.build(scantron_params)
      if @scantron.save
    end

  end

  def update
    @scantron = Scantron.find(params[:id])
    @scantron.update_attributes(scantron_params)

    render :nothing => true
  end

  private

  def scantron_params
    params.require(:scantron).permit(:user_id, :exam_id, :result)
  end
end
