# Strategy Design Pattern

class Formatter
  def output_report(title, text)
    raise "Called #{__method__} from abstract class"
  end
end

class HTMLFormatter < Formatter
  def output_report(title, text)
    puts('<html>')
    puts('<head>')
    puts("<title>#{title}</title>")
    puts('</head>')
    puts('<body>')
    text.each do |text|
      puts("<p>#{text}</p>")
    end
    puts('</body>')
    puts('</html>')
  end
end


class PlainTextFormatter < Formatter
  def output_report(title, text)
    puts "-- #{ title } --"
    text.each do |t|
      puts("--- #{t} ---")
    end
  end
end


class Report
  def initialize(formatter)
    @title = "Monthly Report"
    @text = ["Things are going", "really really well"]
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(@title, @text)
  end
end

Report.new(HTMLFormatter.new).output_report
Report.new(PlainTextFormatter.new).output_report
