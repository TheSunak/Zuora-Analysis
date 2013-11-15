#!/usr/bin/env ruby

require 'awesome_print'
require 'csv'


class ZuoraMRR

	attr_reader :raw_data, :account_data

	def initialize(path)
		@raw_data = CSV.read(path)
	end

	def get_data(row)
		current_row_data = {:account_number => row[1], :rate_plan_start_date => row[7], :seats => row[4], :mrr => row[8], :subscription_date => row[13], :plan => row[11] }
	end

	def group_by_account_number
		all_data = []
		
		raw_data.each do |row|
			current_row_data = get_data(row)
			all_data << current_row_data 
		end	

		grouped_accounts = all_data.group_by{|h| h[:account_number]}

	end

	def determine_oldest_record (grouped_accounts)
			
			dates = grouped_accounts.collect { |k,v| v.collect{|value| value[:rate_plan_start_date]}}

			ap dates.max

			


	
	end

 

end

if ARGV.size == 1
	z = ZuoraMRR.new(ARGV.first)
	grouped_accounts = z.group_by_account_number
	z.determine_oldest_record(grouped_accounts)

else
	puts "Please enter a path"
end




