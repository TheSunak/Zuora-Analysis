#!/usr/bin/env ruby

require 'awesome_print'
require 'csv'

raw_data = CSV.read('/Users/vishal/code/Zuora-Analysis/test/test_data.csv')

$final_data = []


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

# DON'T FORGET THE SUBSCRIPTION DATE CHANGE WITH YEAR!!!!!!!!!!!!!!!!!!!!!!!

raw_data.each do |row|


	current_row_account_number = row[1]

	#Same account
	if (previous_account_number == current_row_account_number)
		#p "Current rate plan start date"
		 current_rate_plan_effective_start_date = get_rate_plan_effective_start_date(row)
		
		#p "Current rate plan charge mrr"
		 current_rate_plan_charge_mrr = get_rate_plan_charge_mrr(row)

		#p "Current Seats"
		 current_seats = get_number_of_seats(row)

		#p "Data to use:"
		 data_to_use = compare_dates(current_rate_plan_effective_start_date, previous_rate_plan_effective_start_date)



		if (data_to_use == "Previous")
			#p "Previous"
			p previous_seats,previous_rate_plan_charge_mrr
		else
			#p "Current"
			 p current_seats,current_rate_plan_charge_mrr
		end
			


	#New Row, just store the data	
	else
		#p "Previous Account Number"
		 previous_account_number = row[1]

		#p "Previous rate plan start date"
		 previous_rate_plan_effective_start_date = get_rate_plan_effective_start_date(row)
		
		#p "Previous rate plan charge mrr"
		 previous_rate_plan_charge_mrr = get_rate_plan_charge_mrr(row)

		#p "Previous Seats"
		 previous_seats = get_number_of_seats(row)

	end

end




