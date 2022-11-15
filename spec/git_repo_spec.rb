require 'spec_helper'
require './lib/git_repo'

RSpec.describe GitRepo do
  before :each do
    @name_response = GitRepo.new.call("https://api.github.com/repos/kenzjoy/little-esty-shop")
    @pull_response = GitRepo.new.call("https://api.github.com/repos/kenzjoy/little-esty-shop/pulls?state=all")
  end

  it "has a method to retrieve data in the form of a hash or an array through an API call" do
    expect(@name_response).to be_a(HTTParty::Response)

    expect(JSON.parse(@name_response.body, symbolize_names: true)).to be_a(Hash)

    expect(@pull_response).to be_a(HTTParty::Response)
  end

  
end