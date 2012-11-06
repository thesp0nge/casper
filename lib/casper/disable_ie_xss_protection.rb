class WEBrick::HTTPResponse

  def disable_ie_xss_protection
    self["X-XSS-Protection"]= 0
  end
  
end
