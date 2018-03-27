module StationsHelper


	def total_amount
		amount = 0
		@station.sales_reports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def estimate_amount
		amount = 0
		@station.sales_reports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end

end
