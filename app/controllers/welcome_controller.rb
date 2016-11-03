require 'net/http'
require 'open-uri'

class WelcomeController < ApplicationController
  


  def fetch
    email= params[:email]
    inurl = 'https://haveibeenpwned.com/api/v2/breachedaccount/' + email
    url = URI(inurl)
    @res =  Net::HTTP.get(url)

    if @res.length <3
      @res = 'not hacked'


    else
    response = JSON.parse(@res)
    response.each do | p|
      pwn=Pwnd.new
      pwn.title = p['Title']
      pwn.name = p['Name']
      pwn.domain = p['Domain']
      pwn.breachdate = p['BreachDate']
      pwn.addeddate = p['AddedDate']
      pwn.pwncount = p['PwnCount']
      pwn.description = p['Description']
      pwn.dataclass = p['DataClasses']
      pwn.isverified = p['IsVerified']
      pwn.issensitive = p['IsSensitive']
      pwn.isretired = p['IsRetired']
      pwn.email = email
      pwn.save
    end

    end

  end

end
