# frozen_string_literal: true

require 'benchmark'
require_relative 'sheep'

# run many times
Benchmark.bm do |rep|
  rep.report("NO THREADS: \n") do
    sheep = Sheep.new

    5.times.map do
      sheep.shear!
    end
  end
end
