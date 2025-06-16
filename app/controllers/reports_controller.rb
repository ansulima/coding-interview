class ReportsController < ApplicationController
  def create
    ReportGenerationJob.perform_async

    render json: { message: 'A geração do relatório foi iniciada.' }, status: :accepted
  end
end
