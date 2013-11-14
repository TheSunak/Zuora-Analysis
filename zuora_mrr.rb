#!/usr/bin/env ruby

require 'awesome_print'
require 'csv'


class ZuoraMRR

	attr_reader :raw_data, :account_data

	def initialize(path)
		@raw_data = CSV.read(path)
	end

	def get_data(row)
		current_row_data = {:account_number => row[1], :rate_plan_start_date => row[7], :seats => row[4], :mrr => row[8], :subscription_date => row[13] }
		[current_row_data]
	end

	def process_rows
		raw_data.each do |row|
			current_row_data = get_data(row)
			ap current_row_data 
		end	

	end

end

if ARGV.size == 1
	z = ZuoraMRR.new(ARGV.first)
	z.process_rows
else
	puts "Please enter a path"
end




