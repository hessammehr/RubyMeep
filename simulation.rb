#!/usr/bin/env ruby
require 'geometry'
require 'pml'

module MEEP
  class Simulation
    attr_accessor :geometry, :sources, :resolution, :size, 
    Defaults = {'progress-interval' => 40, 'resolution' => 5}
    def initialize
      @geometry = geometry
      @sources = sources
      @options = Defaults.merge options
    end
    def to_s
      resolution_str = "(set! resolution #{options['resolution']})"
      geometry = @geometry.join("\n")
      geometry_str = "(set! geometry \n (list\n#{geometry}))"
      sources = @sources.join("\n")
      
    end
    def sources source_list
      @sources = source_list
    end
  end
end
