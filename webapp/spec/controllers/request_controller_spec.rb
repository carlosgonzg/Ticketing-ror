require 'spec_helper'

describe RequestController do

  describe 'correct path' do
    before :each do
      @r1 = mock(Request, :ComputerName => 'meenal tablet', :Subject => 'not working', :urgent => 'true', :id => "1")
    end

    it 'should generate routing for searching request' do
      { :post => search_request_index_path }.should
      route_to(:controller => "request", :action => "search", :request_id => "1")
    end

    it 'should select the display the search result' do
      Request.stub!(:find).with("1").and_return(@r1)
      get :search, :request_id => "1"
      response.should render_template('search')
      assigns(:requests).should == @r1
    end
  end

  describe 'uncorrect search' do
    it 'should generate routing for Searching request' do
      { :post => movie_similar_path(3) }.should
      route_to(:controller => "request", :action => "search", :request_id => "3")
    end

    it 'should generate a flash' do
      Request.stub!(:find).with("3").and_return(@r2)
      get :search, :request_id => "3"
      response.should render_template('search')
      flash[:notice].should_not be_blank
    end
  end
end
