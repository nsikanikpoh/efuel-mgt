module DashboardHelper
	def todaytotal_amount
		amount = 0
		@todayreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def todayestimate_amount
		amount = 0
		@todayreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def yesterdaytotal_amount
		amount = 0
		@yesterdayreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def yesterdayestimate_amount
		amount = 0
		@yesterdayreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def thisweektotal_amount
		amount = 0
		@thisweekreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def thisweekestimate_amount
		amount = 0
		@thisweekreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def pastweektotal_amount
		amount = 0
		@pastweekreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def pastweekestimate_amount
		amount = 0
		@pastweekreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def thismonthtotal_amount
		amount = 0
		@thismonthreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def thismonthestimate_amount
		amount = 0
		@thismonthreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def pastmonthtotal_amount
		amount = 0
		@pastmonthreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def pastmonthestimate_amount
		amount = 0
		@pastmonthreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def quarteryeartotal_amount
		amount = 0
		@quarteryearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def quarteryearestimate_amount
		amount = 0
		@quarteryearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def thisyeartotal_amount
		amount = 0
		@thisyearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def thisyearestimate_amount
		amount = 0
		@thisyearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def pastyeartotal_amount
		amount = 0
		@pastyearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def pastyearestimate_amount
		amount = 0
		@pastyearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end











	def zonetodaytotal_amount
		amount = 0
		@zonetodayreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zonetodayestimate_amount
		amount = 0
		@zonetodayreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def zoneyesterdaytotal_amount
		amount = 0
		@zoneyesterdayreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zoneyesterdayestimate_amount
		amount = 0
		@zoneyesterdayreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def zonethisweektotal_amount
		amount = 0
		@zonethisweekreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zonethisweekestimate_amount
		amount = 0
		@zonethisweekreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def zonepastweektotal_amount
		amount = 0
		@zonepastweekreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zonepastweekestimate_amount
		amount = 0
		@zonepastweekreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def zonethismonthtotal_amount
		amount = 0
		@zonethismonthreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zonethismonthestimate_amount
		amount = 0
		@zonethismonthreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def zonepastmonthtotal_amount
		amount = 0
		@zonepastmonthreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zonepastmonthestimate_amount
		amount = 0
		@zonepastmonthreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def zonequarteryeartotal_amount
		amount = 0
		@zonequarteryearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zonequarteryearestimate_amount
		amount = 0
		@zonequarteryearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def zonethisyeartotal_amount
		amount = 0
		@zonethisyearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zonethisyearestimate_amount
		amount = 0
		@zonethisyearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def zonepastyeartotal_amount
		amount = 0
		@zonepastyearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def zonepastyearestimate_amount
		amount = 0
		@zonepastyearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end










	def stationtodaytotal_amount
		amount = 0
		@stationtodayreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationtodayestimate_amount
		amount = 0
		@stationtodayreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def stationyesterdaytotal_amount
		amount = 0
		@stationyesterdayreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationyesterdayestimate_amount
		amount = 0
		@stationyesterdayreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def stationthisweektotal_amount
		amount = 0
		@stationthisweekreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationthisweekestimate_amount
		amount = 0
		@stationthisweekreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def stationpastweektotal_amount
		amount = 0
		@stationpastweekreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationpastweekestimate_amount
		amount = 0
		@stationpastweekreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def stationthismonthtotal_amount
		amount = 0
		@stationthismonthreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationthismonthestimate_amount
		amount = 0
		@stationthismonthreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def stationpastmonthtotal_amount
		amount = 0
		@stationpastmonthreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationpastmonthestimate_amount
		amount = 0
		@stationpastmonthreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def stationquarteryeartotal_amount
		amount = 0
		@stationquarteryearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationquarteryearestimate_amount
		amount = 0
		@stationquarteryearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def stationthisyeartotal_amount
		amount = 0
		@stationthisyearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationthisyearestimate_amount
		amount = 0
		@stationthisyearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end
	def stationpastyeartotal_amount
		amount = 0
		@stationpastyearreports.each do |sales_report|
			amount += sales_report.amount_brought
		end
		return amount
	end

	def stationpastyearestimate_amount
		amount = 0
		@stationpastyearreports.each do |sales_report|
			amount += sales_report.estimate_amount
		end
		return amount
	end


end


  