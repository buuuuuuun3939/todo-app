require 'rails_helper'

RSpec.describe "subtasks/new", type: :view do
  before(:each) do
    assign(:subtask, Subtask.new())
  end

  it "renders new subtask form" do
    render

    assert_select "form[action=?][method=?]", subtasks_path, "post" do
    end
  end
end
