#!/usr/bin/env ruby
require 'geometry'
require 'pml'

module MEEP
  class Simulation
    attr_accessor :geometry, :sources
    Defaults = {'progress-interval' => 40, 'resolution' => 5}
    def initialize(geometry, sources, options)
      @geometry = geometry
      @sources = sources
      @options = Defaults.merge options
    end
    def to_s
      resolution = "(set! resolution #{options['resolution']})"
      geometry = @geometry.to_s
      sources = @sources.to_s
      
    end
  end
end
