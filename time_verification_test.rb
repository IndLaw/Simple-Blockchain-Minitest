require 'minitest/autorun'

class TIME_VALIDATION_TEST < Minitest::Test

	#Check for formatting
	#should return true
	def test_time_formatting
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		assert test_str =~ /.*\|.*\|.*\|[0-9]*\.[0-9]*\|.*/
	end
	

	#Check that nanoseconds is greater than epoch
	#should return true
	def test_time_equivalence
		String test_array = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'.split('|').map(&:chomp)
		String test_subarray = test_array[3].split('.').map(&:chomp)
		assert test_subarray[0] < test_subarray[1]
	end

end