require 'minitest/autorun'

class HASH_VALIDATION_TEST < Minitest::Test

	#First block always has a hash of 0 at start
	#should return true
	def test_hash_first_block
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		assert_equal test_str[2,2], '0|'	
	end



	#Check that block has valid hashes
	#Should return true
	def test_hash_valid_block
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		assert test_str =~ /.*\|[a-zA-Z0-9]*\|.*\|.*\|[a-zA-Z0-9]*/
	end


	#Check that hash has correct value
	#Should return true
	def test_hash_correct
	
		String test_array1 = '2|abb2|George>Amina(16):Henry>James(4):Henry>Cyrus(17):Henry>Kublai(4):George>Rana(1):SYSTEM>Wu(100)|1518892051.753197000|c72d'.split('|').map(&:chomp)

		x = test_array1[0].unpack('U*') + test_array1[1].unpack('U*') + test_array1[2].unpack('U*') + test_array1[3].unpack('U*')
		sum = 0
		# x.each { |i| puts x[i] }
		# x.delete("")
		x.each { |i| sum += ((x[i].to_i ** 2000) * ((x[i].to_i + 2) ** 21) - ((x[i].to_i + 5) ** 3)) }
		hash = (sum % 65536)
		puts hash.to_s(16)
		
		test_array2 = '3|c72d|SYSTEM>Henry(100)|1518892051.764563000|7419'.split('|').map(&:chomp)
		
		# assert_equal test_str[2,2], '0|'	
	end

	
	#Check that hash at the end of the previous block 
	#matches the hash at the beginning of the next block
	#if a next block exists
	#Should return true
	def test_hash_end_and_start
		test_array1 = '2|abb2|George>Amina(16):Henry>James(4):Henry>Cyrus(17):Henry>Kublai(4):George>Rana(1):SYSTEM>Wu(100)|1518892051.753197000|c72d'.split('|').map(&:chomp)
		test_array2 = '3|c72d|SYSTEM>Henry(100)|1518892051.764563000|7419'.split('|').map(&:chomp)
		assert_equal test_array2[1], test_array1[4]
	end

end