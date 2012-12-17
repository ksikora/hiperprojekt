require 'spec_helper'

describe "hosts/show" do
  before(:each) do
    @host = assign(:host, stub_model(Host))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
