require 'rails_helper'

RSpec.describe "subtasks/edit", type: :view do
  before(:each) do
    @subtask = assign(:subtask, Subtask.create!())
  end

  it "renders the edit subtask form" do
    render

    assert_select "form[action=?][method=?]", subtask_path(@subtask), "post" do
    end
  end
end
