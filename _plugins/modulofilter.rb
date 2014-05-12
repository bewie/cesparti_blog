# Modulo filter for Jekyll
#
# Adds modulo functionality to Jekyll. It's already in the Liquid core, but that
# version doesn't appear to be in Jekyll.
#
# That's about it.
 
module Jekyll
	module ModuloFilter
		# Called 'mod' to avoid conflict with newer Liquid's 'modulo' filter
		# Returns the modulo of the input based on the supplied modulus
		def mod(input, modulus)
			input.to_i % modulus.to_i
		end
	end
end
 
Liquid::Template.register_filter(Jekyll::ModuloFilter)