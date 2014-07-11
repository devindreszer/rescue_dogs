class Message
  URL = "http://www.fortunecookiemessage.com/"

  def get
    text = ""

    while text == ""
      page = Nokogiri::HTML(open(URL))
      text = page.css('div.quote p').text
    end

    text
  end

end
