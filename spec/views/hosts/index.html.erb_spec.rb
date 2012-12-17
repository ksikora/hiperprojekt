require 'spec_helper'

describe "hosts/index" do
  before(:each) do
    assign(:hosts, [
      stub_model(Host),
      stub_model(Host)
    ])
  end

  it "renders a list of hosts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
