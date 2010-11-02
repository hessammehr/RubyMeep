module MEEP
  class PML
    attr_accessor :direction, :thickness
    def initialize(direction=:all, thickness=1.0)
      @direction = direction
      @thickness = thickness
    end
    def to_s
      if @direction == :all then
        "(make pml (thickness #{@thickness})"
      else
        "make pml (thickness #{@thickness} (direction #{@direction.to_s})"
      end
    end
  end
end
