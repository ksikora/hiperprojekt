require 'spec_helper'

describe "monitoring_apps/index" do
  before(:each) do
    assign(:monitoring_apps, [
      stub_model(MonitoringApp),
      stub_model(MonitoringApp)
    ])
  end

  it "renders a list of monitoring_apps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
