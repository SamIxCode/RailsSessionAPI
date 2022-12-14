require 'net/http'
require 'uri'
class ScriptsController < ApplicationController
  #before_action :authenticate_user! 
  @baseurl = 'http://0.0.0.0:8080'

  def python
    @var = params[:id]
    python_var = `python /Users/ganta002/Documents/ruby_projects/ruby_session_tut/sesion_auth-api/session_api/lib/assets/multiplier.py "#{@var}"`
    render json: python_var
  end

  def pyquery 
    qinuput = params[:name]
    user_data = `python /Users/ganta002/Documents/ruby_projects/ruby_session_tut/sesion_auth-api/session_api/lib/assets/psycopg.py "#{qinuput}"`
    render json: user_data
  end

  def run_py
    
    body = '{"email":"' + Current.user.email + '"}'
    url=@baseurl +'/q'
    # Make the POST request and render the response as JSON
    request_json(url, body)
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