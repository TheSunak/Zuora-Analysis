#!/usr/bin/env ruby

require 'awesome_print'
require 'csv'


class ZuoraMRR

	attr_reader :raw_data, :account_data

	def initialize(path)
		@raw_data = CSV.read(path)
	end

	def get_data(row)
		current_row_data = { 
			:mrr 	 => row[8], 
			:plan  => row[11],
			:seats => row[4],
			:account_number 			=> row[1],
			:subscription_date 		=> row[13],
			:rate_plan_start_date => row[7] }
	end

	def group_by_account_number
		raw_data.collect{|row| get_data(row)}.group_by{|h| h[:account_number]}
	end

	def determine_oldest_record(grouped_accounts)
		dates = grouped_accounts.collect do |k,v|
			v.collect{|value| value[:rate_plan_start_date]}
		end
		
		ap dates.max
	end

end

################
# Main Program #
################

# Example CLI input:
# 	ruby zuora_mrr.rb <file_path>

if ARGV.size == 1
	z = ZuoraMRR.new(ARGV.first)
	grouped_accounts = z.group_by_account_number
	z.determine_oldest_record(grouped_accounts)
else
	puts "Please enter a path."
end