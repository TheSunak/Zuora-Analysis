#!/usr/bin/env ruby

require 'awesome_print'
require 'csv'

raw_data = CSV.read('/Users/vishal/code/Zuora-Analysis/test/test_data.csv')

final_data = []


def get_rate_plan_effective_start_date (row)
	[row[7]]
end

def get_number_of_seats(row)
	[row[4]]
end

def get_rate_plan_charge_mrr(row)
	[row[8]]
end

def translate_plans_to_mrr(row)


end

def compare_dates(current_date, previous_date)
	if current_date[0] < previous_date[0]
		["Previous"]
	else
		["Current"]
	end


end

def store_results(seats, mrr)
final_data << [seats, mrr]

end





previous_account_number = ""
previous_rate_plan_effective_start_date = ""
previous_rate_plan_charge_mrr = ""

raw_data.each do |row|


	current_row_account_number = row[1]

	#Same account
	if (previous_account_number == current_row_account_number)
		p "Current rate plan start date"
		p current_rate_plan_effective_start_date = get_rate_plan_effective_start_date(row)
		
		p "Current rate plan charge mrr"
		p current_rate_plan_charge_mrr = get_rate_plan_charge_mrr(row)

		p "Current Seats"
		p current_seats = get_number_of_seats(row)

		p "Data to use:"
		p data_to_use = compare_dates(current_rate_plan_effective_start_date, previous_rate_plan_effective_start_date)

		store_results 


	#New Row, just store the data	
	else
		p "Previous Account Number"
		p previous_account_number = row[1]

		p "Previous rate plan start date"
		p previous_rate_plan_effective_start_date = get_rate_plan_effective_start_date(row)
		
		p "Previous rate plan charge mrr"
		p previous_rate_plan_charge_mrr = get_rate_plan_charge_mrr(row)

		p "Previous Seats"
		p previous_seats = get_number_of_seats(row)

	end


end




