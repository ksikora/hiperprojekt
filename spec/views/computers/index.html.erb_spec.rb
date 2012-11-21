require 'spec_helper'

describe "computers/index" do
  before(:each) do
    assign(:computers, [
      stub_model(Computer,
        :host => "Host",
        :name => "Name"
      ),
      stub_model(Computer,
        :host => "Host",
        :name => "Name"
      )
    ])
  end

  it "renders a list of computers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
