require 'minitest/autorun'

class BLOCKFILE_VALIDATION_TEST < Minitest::Test

	#Blockchain starts at 0
	#should return true
	def test_blockchain_starts_with_0
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		assert_equal test_str[0,2], '0|' 
	end


	#First block has only 1 transaction
	#Should return true
	def test_first_block_transaction_true
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12' 
		refute test_str.include? ":"	
	end

	#First transaction is made by the system
	#should return true
	def test_first_system_transaction_true
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		assert test_str =~ /0\|0\|SYSTEM>.*\(100\)\|.*/		
	end
	
	#First transaction is made by the system
	#should return false
	def test_first_system_transaction_false
		String test_str = '0|0|Saitama>Henry(100)|1518892051.737141000|1c12'
		refute test_str =~ /0\|0\|SYSTEM>.*\(100\)\|.*/		
	end

	#Blockchain increments by 1
	#should return true
	def test_blockchain_increments_true
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12
1|1c12|SYSTEM>George(100)|1518892051.740967000|abb2
2|abb2|George>Amina(16):Henry>James(4):Henry>Cyrus(17):Henry>Kublai(4):George>Rana(1):SYSTEM>Wu(100)|1518892051.753197000|c72d
3|c72d|SYSTEM>Henry(100)|1518892051.764563000|7419
4|7419|Kublai>Pakal(1):Henry>Peter(10):Cyrus>Amina(3):Peter>Sheba(1):Cyrus>Louis(1):Pakal>Kaya(1):Amina>Tang(4):Kaya>Xerxes(1):SYSTEM>Amina(100)|1518892051.768449000|97df
5|97df|Henry>Edward(23):Rana>Alfred(1):James>Rana(1):SYSTEM>George(100)|1518892051.783448000|d072
6|d072|Wu>Edward(16):SYSTEM>Amina(100)|1518892051.793695000|949
7|949|Louis>Louis(1):George>Edward(15):Sheba>Wu(1):Henry>James(12):Amina>Pakal(22):SYSTEM>Kublai(100)|1518892051.799497000|32aa
8|32aa|SYSTEM>Tang(100)|1518892051.812065000|775a
9|775a|Henry>Pakal(10):SYSTEM>Amina(100)|1518892051.815834000|2d7f'

		lines = test_str.lines.count - 1
		ordered = true
		substrings = test_str.lines.map(&:chomp)
		for i in 0..lines do
			if substrings[i][0,2] != i
				ordered = false
				break
			end
		end	
		
		assert ordered
	end

	#Blockchain increments by 1
	#should return true
	def test_blockchain_increments_false
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12
1|1c12|SYSTEM>George(100)|1518892051.740967000|abb2
2|abb2|George>Amina(16):Henry>James(4):Henry>Cyrus(17):Henry>Kublai(4):George>Rana(1):SYSTEM>Wu(100)|1518892051.753197000|c72d
3|c72d|SYSTEM>Henry(100)|1518892051.764563000|7419
6|7419|Kublai>Pakal(1):Henry>Peter(10):Cyrus>Amina(3):Peter>Sheba(1):Cyrus>Louis(1):Pakal>Kaya(1):Amina>Tang(4):Kaya>Xerxes(1):SYSTEM>Amina(100)|1518892051.768449000|97df
5|97df|Henry>Edward(23):Rana>Alfred(1):James>Rana(1):SYSTEM>George(100)|1518892051.783448000|d072
6|d072|Wu>Edward(16):SYSTEM>Amina(100)|1518892051.793695000|949
4|949|Louis>Louis(1):George>Edward(15):Sheba>Wu(1):Henry>James(12):Amina>Pakal(22):SYSTEM>Kublai(100)|1518892051.799497000|32aa
8|32aa|SYSTEM>Tang(100)|1518892051.812065000|775a
9|775a|Henry>Pakal(10):SYSTEM>Amina(100)|1518892051.815834000|2d7f'

		lines = test_str.lines.count - 1
		ordered = true
		substrings = test_str.lines.map(&:chomp)
		for i in 0..lines do
			if substrings[i][0,2] != i
				ordered = false
				break
			end
		end	
		refute ordered
	end

	#Final transaction is made by the system
	#should return true
	def test_last_transaction_true
		String test_str = '9|775a|Henry>Pakal(10):SYSTEM>Amina(100)|1518892051.815834000|2d7f'
		assert test_str =~ /.*:SYSTEM>.*\(100\)\|.*/			
	end
	
	#Final transaction is made by the system
	#should return false
	def test_last_transaction_false
		String test_str = '9|775a|Henry>Pakal(10):Saitama>Amina(100)|1518892051.815834000|2d7f'
		refute test_str =~ /.*:SYSTEM>.*\(100\)\|.*/			
	end


end

