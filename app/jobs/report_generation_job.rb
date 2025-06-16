class ReportGenerationJob < ApplicationJob
  queue_as :default

  def perform
    Reports::GeneratorService.new.call
  end
end