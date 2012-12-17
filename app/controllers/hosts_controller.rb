class HostsController < ApplicationController
  # GET /hosts
  # GET /hosts.json
  def index

		key = SimpleApp::Application::encrypt('/hosts', 'hiperprojekt')
	  response = Typhoeus::Request.get("#{SimpleApp::Application::KatalogIp}/hosts").body
	  #response = Typhoeus::Request.get("#{SimpleApp::Application::KatalogIp}#{key}").body

		#puts response
    $hosts = JSON.parse(response)
						#puts $hosts
    respond_to do |format|
      format.html # {render text: $hosts} # index.html.erb
      format.json { render json: $hosts}
    end
  end


  def show	# pokazuje naglowki feedow dla konkretnego hosta

				#url  = host["uri"]
				url = params[:feedslist]
				#puts 'aaaaaaaaaaaaaaa'
				#puts url.inspect
				#puts 'aaaaaaaaaaaaaaaaaa'
				#puts url
				url =	url.gsub('XXX','.')
				key = SimpleApp::Application::encrypt("#{url}", 'hiperprojekt')
				response = 	Typhoeus::Request.get("#{url}").body
				#response = 	Typhoeus::Request.get('#{key}').body
				$feeds = JSON.parse(response)
				
				#puts $feeds


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: $feeds }
    end
  end

	def showfeed # pokazuje konkretnego feeda
		url = params[:monitor_feed_uri]
				puts 'aaaaaaaaaaaaaaa'
				puts url.inspect
				puts 'aaaaaaaaaaaaaaaaaa'

		url =	url.gsub('XXX','.')
		
		puts url.inspect
		key = SimpleApp::Application::encrypt("#{url}", 'hiperprojekt')
		response = 	Typhoeus::Request.get("#{url}").body
		puts response
		puts 'aaaaaaaaaaaaaaaaaa'
		#response = 	Typhoeus::Request.get("#{key}").body
		respData = JSON.parse(response)
		puts respData
				puts 'aaaaaaaaaaaaaaaaaa'
		$feeds = respData["respData"]
		puts $feeds
		
		render 'showfeed'
	end
	
	
	
	
	
	
	
	
	
	
	

  # GET /hosts/new
  # GET /hosts/new.json
  def new
    @host = Host.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @host }
    end
  end

  # GET /hosts/1/edit
  def edit
    @host = Host.find(params[:id])
  end

  # POST /hosts
  # POST /hosts.json
  def create
    @host = Host.new(params[:host])

    respond_to do |format|
      if @host.save
        format.html { redirect_to @host, notice: 'Host was successfully created.' }
        format.json { render json: @host, status: :created, location: @host }
      else
        format.html { render action: "new" }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hosts/1
  # PUT /hosts/1.json
  def update
    @host = Host.find(params[:id])

    respond_to do |format|
      if @host.update_attributes(params[:host])
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    @host = Host.find(params[:id])
    @host.destroy

    respond_to do |format|
      format.html { redirect_to hosts_url }
      format.json { head :no_content }
    end
  end
end
