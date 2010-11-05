RubyMeep specifications
=======================
RubyMeep is a thin Ruby interface for Meep.

General use case
----------------
A simulation is set up and run, with the results optionally post-processed.

Simulations
-----------
Every simulation must specify the following.

* geometry
* sources
* dimensions (size)
* resolution

Simulations may also specify the following.

* PML layers
* periodicity conditions (direction, k-vector)

This can be done on initialization, in a block, or using a combination of the two.

	mysim = Simulation  :resolution => 20, :size => [10, 10] do
		geometry = [obj1, obj2]
		sources = [source1, source2]
	end

Geometry
--------
The 
