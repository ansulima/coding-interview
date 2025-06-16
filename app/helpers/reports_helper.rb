module ReportsHelper
  def status_badge_color(status)
    case status
    when 'completed' then 'success'
    when 'processing' then 'info'
    when 'failed' then 'danger'
    else 'secondary'
    end
  end
  
  def format_report_parameters(parameters)
    return 'Nenhum parâmetro' if parameters.blank?
    
    if parameters.is_a?(String)
      begin
        parameters = JSON.parse(parameters)
      rescue JSON::ParserError
        return parameters
      end
    end
    
    content_tag(:ul, class: 'list-unstyled') do
      parameters.map do |key, value|
        content_tag(:li) do
          content_tag(:strong, "#{key.humanize}:") + " #{value}"
        end
      end.join.html_safe
    end
  end
end
