# The Template Method Pattern

class Report
  def initialize
    @title = "Monthly Report"
    @text = ["Things are going", "really really well"]
  end

  def output
    puts('<html>')
    puts('<head>')
    puts("<title>#{@title}</title>")
    puts('</head>')
    puts('<body>')
    @text.each do |text|
      puts("<p>#{text}</p>")
    end
    puts('</body>')
    puts('</html>')
  end
end

Report.new.output

# Now we need to support printing the report in the following formats:
# 1) Plain Text
# 2) HTML
# 3) RTF
# 4) PostScript

class Report
  def initialize
    @title = "Monthly Report"
    @text = ["Things are going", "really really well"]
  end

  def output(format:)
    # TITLE
    if format == :html
      puts('<html>')
      puts('<head>')
      puts("<title>#{@title}</title>")
      puts('</head>')
    elsif format == :plain
      puts "-- #{ @title } --"
    end

    # BODY
    if format == :html
      puts('<body>')
      @text.each do |text|
        puts("<p>#{text}</p>")
      end
      puts('</body>')
      puts('</html>')
    elsif format == :plain
      puts "-- #{ @text.join(', ') } --"
    end
  end
end

Report.new.output(format: :html)
Report.new.output(format: :plain)

# Implement a design that separates the code for the various formats

# 1 create an abstract base class
# 2 create a sub class for every output format

class Report
  def initialize
    @title = "Monthly Report"
    @text = ["Things are going", "really really well"]
  end


  def output_report
    output_start
    output_head
    output_body_start
    output_body
    output_body_end
    output_end
  end

  def output_start
    raise "called #{__method__} from the abstract class"
  end

  def output_head
    output_line(@title)
  end

  def output_body_start
    raise "called #{__method__} from the abstract class"
  end

  # KEY TEMPLATE METHOD
  # THIS IS NOT OVERRIDEN IN THE SUB CLASSES
  def output_body
    @text.each do |text|
      output_line(text)
    end
  end

  def output_line
    raise "called #{__method__} from the abstract class"
  end

  def output_body_end
    raise "called #{__method__} from the abstract class"
  end

  def output_end
    raise "called #{__method__} from the abstract class"
  end
end

# Report.new.output_report

class HTMLReport < Report
  def output_start
    puts('<html>')
  end

  def output_head
    puts('<head>')
    output_line(@title)
    puts('</head>')
  end

  def output_body_start
    puts('<body>')
  end

  def output_line(line)
    puts("<p>#{line}</p>")
  end

  def output_body_end
    puts('</body>')
  end

  def output_end
    puts('</html>')
  end
end

HTMLReport.new.output_report

class PlainTextReport < Report
  def output_start
  end

  def output_head
    output_line(@title)
  end

  def output_body_start
  end

  def output_line(line)
    puts "-- #{ line } --"
  end

  def output_body_end
  end

  def output_end
  end
end

PlainTextReport.new.output_report

# Hook methods - non abstact methods
# override default abstact class methods
# or accepts base class default implementation

# Unit test the ^^ template method pattern


