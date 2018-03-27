class DashboardController < ApplicationController

  def dashboard

  if current_admin.companyadmin?
      if current_admin.company == nil
       
        redirect_to new_company_path, notice: 'Admin Account was succesfully created. You have to set up your Company Profile'
      else
        companyreports

      end
elsif current_admin.zonalmanager? || current_admin.manager?
   companyreports  
end
     

  end

  def companyzones

  		@zones = current_admin.zones.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  end


  def companystations
  		@stations = current_admin.stations.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  end

  def companyzonalmanagers
  	@zonalmanagers = current_admin.zonalmanagers.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  end

  def companymanagers

  	@managers =current_admin.managers.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  end

  def companyreports
if current_admin.companyadmin?   
  @sales_reports1 = current_admin.company.sales_reports.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
    @sales_reports = current_admin.company.sales_reports 
    #current_admin.company.sales_reports 
    @todayreports = current_admin.company.sales_reports.today.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @yesterdayreports = current_admin.company.sales_reports.yesterday.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @thisweekreports = current_admin.company.sales_reports.by_week.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  
  @pastweekreports = current_admin.company.sales_reports.past_week.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @thismonthreports = current_admin.company.sales_reports.by_calendar_month.paginate(page: params[:page], per_page: 10).order(created_at: :desc, id: :desc)
  @pastmonthreports = current_admin.company.sales_reports.past_month.paginate(page: params[:page], per_page: 10).order(created_at: :desc, id: :desc)

  @quarteryearreports = current_admin.company.sales_reports.by_quarter.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  @thisyearreports = current_admin.company.sales_reports.by_year.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  @pastyearreports = current_admin.company.sales_reports.past_year .paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)

elsif current_admin.zonalmanager?

   @zonesales_reports = current_admin.zone.sales_reports
    #current_admin.company.sales_reports 
    @zonetodayreports = current_admin.zone.sales_reports.today.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @zoneyesterdayreports = current_admin.zone.sales_reports.yesterday.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @zonethisweekreports = current_admin.zone.sales_reports.by_week.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  
  @zonepastweekreports = current_admin.zone.sales_reports.past_week.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @zonethismonthreports = current_admin.zone.sales_reports.by_calendar_month.paginate(page: params[:page], per_page: 10).order(created_at: :desc, id: :desc)
  @zonepastmonthreports = current_admin.zone.sales_reports.past_month.paginate(page: params[:page], per_page: 10).order(created_at: :desc, id: :desc)

  @zonequarteryearreports = current_admin.zone.sales_reports.by_quarter.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  @zonethisyearreports = current_admin.zone.sales_reports.by_year.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  @zonepastyearreports = current_admin.zone.sales_reports.past_year.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)

elsif current_admin.manager?

   @stationsales_reports = current_admin.station.sales_reports
    #current_admin.company.sales_reports 
    @stationtodayreports = current_admin.station.sales_reports.today.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @stationyesterdayreports = current_admin.station.sales_reports.yesterday.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @stationthisweekreports = current_admin.station.sales_reports.by_week.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  
  @stationpastweekreports = current_admin.station.sales_reports.past_week.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  @stationthismonthreports = current_admin.station.sales_reports.by_calendar_month.paginate(page: params[:page], per_page: 10).order(created_at: :desc, id: :desc)
  @stationpastmonthreports = current_admin.station.sales_reports.past_month.paginate(page: params[:page], per_page: 10).order(created_at: :desc, id: :desc)

  @stationquarteryearreports = current_admin.station.sales_reports.by_quarter.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  @stationthisyearreports = current_admin.station.sales_reports.by_year.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  @stationpastyearreports = current_admin.station.sales_reports.past_year.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  
end

end
end