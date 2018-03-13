require 'minitest/autorun'

class BLOCKFILE_VALIDATION_TEST < Minitest::Test

	#Blockchain starts at 0
	def test_blockchain_starts_with_0
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		assert_equal test_str[0,2], '0|' 
	end


	#First block has only 1 transaction
	def test_first_block_transaction
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		
	end

	#First transaction is made by the system
	def test_first_system_transaction
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		
	end

	#Blockchain increments by 1



	#Final transaction is made by the system



end

