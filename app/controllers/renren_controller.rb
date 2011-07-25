class RenrenController < ApplicationController
  #require 'rubygems'
 
  require 'oauth2'
  require 'json'
  require 'net/http'

  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  def login
    redirect_to client.web_server.authorize_url(
      :redirect_uri => "http://demo.com:3000/renren/loginnext",
      :response_type=>'code'
    )
  end

  def loginnext

    logger.debug "Client : #{client.inspect}"
    logger.debug "WebServer : #{client.web_server.inspect}"

    #debugger
 
    access_token = client.web_server.get_access_token(params[:code], {:redirect_uri => "http://demo.com:3000/renren/loginnext"})
    session[:renren_access_token]=JSON.parse(access_token)
    #到了这里已经得到了access_token，我暂时把它存在session里面，方便以后使用

    geturi=URI.parse(URI.encode("http://graph.renren.com/renren_api/session_key?oauth_token=#{session['renren_access_token']['access_token']}"))
    #获得Session Key,为调用renren api做准备

    res=JSON Net::HTTP.get(geturi)#这里我们就得到了人人 api

    session[:renren_session_key]= res["renren_token"]["session_key"]
    session[:renren_expires_in]=res["renren_token"]["expires_in"]
    session[:renren_refresh_token]=res["renren_token"]["refresh_token"]

    redirect_to "/renren/message"#定向到我们的应用页面
  end

  def message
    session_key=session[:renren_session_key]
    
    str="api_key=#{api_key}"
    str<<"call_id=#{Time.now.to_i}"
    str<<"fields=uid,name,sex,star,zidou,vip,birthday,email_hash,tinyurl,headurl,mainurl,hometown_location,work_info,university_history"
    str<<"format=JSON" 
    str<<"method=xiaonei.users.getInfo"
    str<<"session_key=#{session_key}"
    str<<"v=1.0"
    str<<"#{api_secret}"#注意这里的str是有顺序的，具体的要求请参考［4］
    
    sig=Digest::MD5.hexdigest(str)#生成参数sig（这是个什么东东呢，人人的解释是“ 它是由当前请求参数和secretKey的一个MD5值”）
    
    query={:api_key=>api_key,
           :call_id=>Time.now.to_i,
           :format=>'JSON',
           :method=>'xiaonei.users.getInfo',
           :session_key=>session_key,
           :v=>'1.0',
           :sig=>sig,
           :fields=>'uid,name,sex,star,zidou,vip,birthday,email_hash,tinyurl,headurl,mainurl,hometown_location,work_info,university_history'
    }#按照api组织参数
    
    @user=JSON Net::HTTP.post_form(URI.parse(URI.encode("http://api.renren.com/restserver.do")), query).body
    #请求数据并且转换成json数据 
  end

  def redirect_uri
    uri = URI.parse(request.url)
    uri.path = '/renren/loginnext'
    uri.query = nil
    uri.to_s
  end

  def api_key
    #这里定义你在人人的应用的api_key，例如“23f7a7aaed9c121f6b6d22d89c7bbd14”
    '6abc5e981287443ab2edbbfbac304c4d'
  end

  def api_secret
    #这里定义你在人人的应用的secret
    'e2ab2773addb41929531e01d98bfdebd'
  end

  def client
    OAuth2::Client.new(api_key,api_secret,:site => {
           :url=>'https://graph.renren.com',
           :response_type=>'code'},:access_token_url => 'https://graph.renren.com/oauth/token')
  end
end
