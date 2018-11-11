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
  attr_accessor :formatter
  def initialize(formatter)
    @title = "Monthly Report"
    @text = ["Things are going", "really really well"]
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(@title, @text)
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report

# select a strategy class at runtime
report.formatter = PlainTextFormatter.new

report.output_report
# Report.new(PlainTextFormatter.new).output_report



# Pass data from the context to the strategy
# Context - the Report class pass self
# Strategy - Formatter, HTMLFormatter, PlainTextFormatter


class Formatter
  def output_report(context)
    raise "Called #{__method__} from abstract class"
  end
end

class HTMLFormatter < Formatter
  def output_report(context)
    puts('<html>')
    puts('<head>')
    puts("<title>#{context.title}</title>")
    puts('</head>')
    puts('<body>')
    context.text.each do |text|
      puts("<p>#{text}</p>")
    end
    puts('</body>')
    puts('</html>')
  end
end


class PlainTextFormatter < Formatter
  def output_report(context)
    puts "-- #{ context.title } --"
    context.text.each do |t|
      puts("--- #{t} ---")
    end
  end
end


class Report

  attr_accessor :formatter, :title, :text

  def initialize(formatter)
    @title = "Monthly Report"
    @text = ["Things are going", "really really well"]
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(self)
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report

# select a strategy class at runtime
report.formatter = PlainTextFormatter.new

report.output_report
# Report.new(PlainTextFormatter.new).output_report

