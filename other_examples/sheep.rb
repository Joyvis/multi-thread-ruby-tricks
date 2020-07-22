# frozen_string_literal: true

require 'colorize'

class Sheep
  def initialize
    @shorn = false
    @mutex = Mutex.new
  end

  def shear!
    # @mutex.synchronize do
      return if shorn?

      puts "shearing...".green
      @shorn = true
    # end
  end

  private

  def shorn?
    @shorn
  end
end

