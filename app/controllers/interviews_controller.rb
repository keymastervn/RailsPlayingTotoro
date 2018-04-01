class InterviewsController < ApplicationController
  def index
  end

  def create
  end

  def new
    @interview = Interview.new
    @interview.save

    dev = Developer.find(interview_params[:dev])
    @interview.developer = dev

    respond_to do |format|
      format.html { redirect_to developers_url, notice: "Interview was successfully created for #{dev.email}." }
      format.json { head :no_content }
    end
  end

  def interview_params
    params.permit(:dev)
  end
end
