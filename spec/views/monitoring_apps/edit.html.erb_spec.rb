require 'spec_helper'

describe "monitoring_apps/edit" do
  before(:each) do
    @monitoring_app = assign(:monitoring_app, stub_model(MonitoringApp))
  end

  it "renders the edit monitoring_app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => monitoring_apps_path(@monitoring_app), :method => "post" do
    end
  end
end
