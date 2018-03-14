require 'minitest/autorun'
require_relative 'verifier.rb'

class TRANSACTION_VALIDATION_TEST < Minitest::Test

#check that system sends coins to valid address in first block
#Should return true
	def test_first_transaction_formatting
		String test_str = '0|0|SYSTEM>Henry(100)|1518892051.737141000|1c12'
		assert test_str =~ /.*\|.*\|SYSTEM>[a-zA-Z]{1,6}\(100\)\|.*\|.*/
	end



#check that other addresses consist of 6 or fewer alphabetic letters
#Should return true
	def test_transaction_formatting
		String test_str = '8|e01d|Sam>John(3):Joe>Sam(4):SYSTEM>Rana(100)|1518839370.605237540|c87b'
		assert test_str =~ /.*\|.*\|([a-zA-Z]{0,6}>[a-zA-Z]{0,6}\([0-9]*\):)*SYSTEM>.*\(100\)\|.*\|.*/
	end


#adds addresses to array
#Prints addresses
#no assertions 
	def test_transaction_validity
		account_array = []
		tempity = []
		j = 0
		String test_array = '6|d072|Wu>Edward(16):SYSTEM>Amina(100)|1518892051.793695000|949'.split('|').map(&:chomp)
		String test_subarray = test_array[2].split(/\W+/).map(&:chomp)
			for i in 0..test_subarray.count-1 do
				if test_subarray[i].to_i.to_s == test_subarray[i]
				j += 1
				    temp = test_subarray[i].to_i
					account_array[j-1].new_balance(-temp)
					account_array[j].new_balance(temp)
					j += 1
				else
					account = Account::new(test_subarray[i])
					if tempity.include? test_subarray[i]
						next
					else
					account_array.push(account)
					tempity.push(test_subarray[i])
					end
					
				end
			
				
			end
					account_array.each { |i| puts  "#{i.name}: #{i.balance} billcoins"}

	
	end

end