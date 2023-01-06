require 'net/http'
require 'uri'
require 'json'

class ScriptsController < ApplicationController
  #before_action :authenticate_user! 
  @@baseurl = 'http://localhost:8080'


  def run_py
    
    json = {email: Current.user.email}
    body = json.to_json
    url = "#{@@baseurl}/q"
    # Make the POST request and render the response as JSON
    request_json(url,body)
  end

  def send_sms
    json = {id:Current.user.id}
    body = json.to_json
    url = @baseurl +'/send_sms'
    request_json(url,body)
  end

  def verify
    sms_code = params[:sms_code]
    json = {
      id:Current.user.id,
      sms_code:sms_code
    }
    body = json.to_json
    url = @baseurl +'/send_sms'
    request_json(url,body)
  end



  private

  def request_json(url, body)
    require 'net/http'
    require 'json'

    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri)
    request['Content-Type'] = 'application/json'
    request.body = body

    response = http.request(request)

    # Render the response as JSON
    render json: {response:response.body}
  end
  
end
 # admin client manager helpdesk