module MEEP
  class KPoint
    attr_accessor :freqs, :k
    def initialize k, freqs
      @k = k
      @freqs = freqs
    end
    
    # String representation of k-point
    # e.g. k-point at (0, 0, 0)
    def to_s
      "k-point at k=(#{k[0]}, #{k[1]}, #{k[2]}) omega = #{freqs.to_s[1..-2]}"
    end
  end
end
