class MonitoringAppsController < ApplicationController
  # GET /monitoring_apps
  # GET /monitoring_apps.json
  def index
    
    
		key = SimpleApp::Application::encrypt('/monitors', 'hiperprojekt')
		response = Typhoeus::Request.get("#{SimpleApp::Application::KatalogIp}/monitors").body
		#response = Typhoeus::Request.get("#{SimpleApp::Application::KatalogIp}#{key}").body
		
		$monitoring_apps = JSON.parse(response)
		puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
		puts $monitoring_apps
		puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
		
		
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: $monitoring_apps }
    end

  end

	def showhosts
		url = params[:hosts_list]
		url =	url.gsub('XXX','.')
		key = SimpleApp::Application::encrypt("#{url}", 'hiperprojekt')
		response = 	Typhoeus::Request.get("#{url}").body
		#response = 	Typhoeus::Request.get("#{key}").body
		$hosts = JSON.parse(response)
		
		render 'hosts/index'
	end

	def showfeeds
		url = params[:feeds_list]
		url =	url.gsub('XXX','.')
		key = SimpleApp::Application::encrypt("#{url}", 'hiperprojekt')
		response = 	Typhoeus::Request.get("#{url}").body
		#response = 	Typhoeus::Request.get("#{key}").body
		$feeds = JSON.parse(response)
		
		render 'feeds/index'
	end












  # GET /monitoring_apps/1
  # GET /monitoring_apps/1.json
  def show
    @monitoring_app = MonitoringApp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @monitoring_app }
    end
  end

  # GET /monitoring_apps/new
  # GET /monitoring_apps/new.json
  def new
    @monitoring_app = MonitoringApp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monitoring_app }
    end
  end

  # GET /monitoring_apps/1/edit
  def edit
    @monitoring_app = MonitoringApp.find(params[:id])
  end

  # POST /monitoring_apps
  # POST /monitoring_apps.json
  def create
    @monitoring_app = MonitoringApp.new(params[:monitoring_app])

    respond_to do |format|
      if @monitoring_app.save
        format.html { redirect_to @monitoring_app, notice: 'Monitoring app was successfully created.' }
        format.json { render json: @monitoring_app, status: :created, location: @monitoring_app }
      else
        format.html { render action: "new" }
        format.json { render json: @monitoring_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /monitoring_apps/1
  # PUT /monitoring_apps/1.json
  def update
    @monitoring_app = MonitoringApp.find(params[:id])

    respond_to do |format|
      if @monitoring_app.update_attributes(params[:monitoring_app])
        format.html { redirect_to @monitoring_app, notice: 'Monitoring app was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @monitoring_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monitoring_apps/1
  # DELETE /monitoring_apps/1.json
  def destroy
    @monitoring_app = MonitoringApp.find(params[:id])
    @monitoring_app.destroy

    respond_to do |format|
      format.html { redirect_to monitoring_apps_url }
      format.json { head :no_content }
    end
  end
end
