class ReportsController < ApplicationController
  def reportseven
  	@title      = 'Reports'
    @description = 'Report #7'

    @affiliates = Affiliate.where(:isfaculty => 0)

    respond_to do |format|
          format.html 
          format.xls  { response.headers['Content-Disposition'] = 'attachment; filename="affiliates_' +  Time.now.to_s + '.xls"' } 
   end

  end
end
