require 'spec_helper'

describe "monitoring_apps/new" do
  before(:each) do
    assign(:monitoring_app, stub_model(MonitoringApp).as_new_record)
  end

  it "renders new monitoring_app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => monitoring_apps_path, :method => "post" do
    end
  end
end
