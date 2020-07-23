# frozen_string_literal: true

require 'benchmark'
require_relative 'sheep'

Benchmark.bm do |rep|
  rep.report("THREADS: \n") do
    sheep = Sheep.new

    5.times.map do
      Thread.new do
        sheep.shear!
      end
    end.map(&:join)
  end
end
