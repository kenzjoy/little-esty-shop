require 'rails_helper'

describe "layouts/application" do

  context "displays repo info" do
    it "should display repo info at the bottom" do
      render
      rendered {should have_css('div.repo')}
      rendered {should have_css('div.group')}
      rendered {should have_css('div.commits')}
      rendered {should have_css('div.pull')}
    end
  end
end