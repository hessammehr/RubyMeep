#!/usr/bin/env ruby
$:.unshift '.'

require 'test/unit'
require 'rainbow'
require 'outputparser'
require 'kpoint'

class OutputTester < MiniTest::Unit::TestCase
  OUTPUT_FILE = File.absolute_path ARGV[0]
  MIN_QUALITY = 10 
  
  def setup
    @output = MEEP::OutputParser.new OUTPUT_FILE  
  end
  
  # Connection test
  def test_connection
    info "Connection test: testing OutputParser proxy object" 
    assert_kind_of MEEP::OutputParser, @output
  end
  
  # Quality factor test
  def test_quality
    info "Quality factor test: listing k-points with Q>#{MIN_QUALITY}"
    out = @output.filter_quality MIN_QUALITY
    assert_kind_of Array, out
    puts out.to_s[1..-2] + "\n"
  end
  
  # Band structure dump test
  def test_band_structure
    info "Band structure test: dumping band structure"
    band_structure = @output.band_structure
    assert_kind_of Array, band_structure
    band_structure.each do |x|
      assert_kind_of MEEP::KPoint, x
      puts x
    end
  end

  def info message
		puts "\n" + 'info '.foreground(:yellow) + message
	end
end
