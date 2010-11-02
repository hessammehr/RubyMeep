#!/usr/bin/env ruby
require 'csv'
require 'kpoint'

module MEEP
  class OutputParser
    attr_reader :raw_data
    
    # Open MEEP output 'filename'
    def initialize(filename)
      @raw_data = IO.read filename
      yield self if block_given?
    end
    
    # Returns an array of 3-vectors, one for each k_point
    def k_points
      k_point_lines = @raw_data.scan(/freqs:, (.*)/).join "\n"
      CSV.parse(k_point_lines, :converters => :numeric).map do |nums|
        # nums[0] => k_point number nums[1..3] => k_point components
        [nums[0], nums[1..3]]
      end
    end
    
    def freqs_simple
      freq_lines = @raw_data.scan(/freqs:, (.*)/).join "\n"
      CSV.parse(freq_lines, :converters => :numeric).map do |nums|
        # nums[0] => k_point number nums[4..-1] => frequencies
        [nums[0], nums[4..-1]]
      end
    end
    
    # Parse the output into a series of k-points each associated with
    # multiple frequencies.
    def band_structure
      freq_lines = @raw_data.scan(/freqs:, (.*)/).join "\n"
      CSV.parse(freq_lines, :converters => :numeric).map do |nums|
        ::MEEP::KPoint.new nums[1..3], nums[4..-1]
      end
    end
    
    #Filter modes by minimum quality factor
    def filter_quality(min_quality)
      mode_lines = @raw_data.scan(/harminv.*:, (\d.*)/).join "\n"
      CSV.parse(mode_lines,
      :converters => :numeric).find_all {|nums| nums[2].abs > min_quality}
    end
  end
end
