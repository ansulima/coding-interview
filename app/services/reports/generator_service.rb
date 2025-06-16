class Reports::GeneratorService
  def call
    puts "Iniciando a geração do relatório de tweets..."
    report_lines = []

    Tweet.includes(:user).find_each do |tweet|
      report_lines << "#{tweet.user.username}: #{tweet.body}"
    end

    if report_lines.any?
      Report.create!(data: report_lines.join("\n"))
      puts "Relatório gerado com sucesso."
    else
      puts "Nenhum tweet encontrado."
    end
  rescue => e
    puts "ERRO ao gerar relatório: #{e.message}"
    raise e
  end
end