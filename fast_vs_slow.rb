# template for benchmarking slow v/s fast methods
require 'benchmark/ips'

def fast
end


def slow
end

Benchmark.ips do |x|
  x.report("fast method") { fast }
  x.report("slow method") { slow }
  x.compare!
end




