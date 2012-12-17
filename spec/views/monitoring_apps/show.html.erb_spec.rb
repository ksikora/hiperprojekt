require 'spec_helper'

describe "monitoring_apps/show" do
  before(:each) do
    @monitoring_app = assign(:monitoring_app, stub_model(MonitoringApp))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
