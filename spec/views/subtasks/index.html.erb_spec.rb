require 'rails_helper'

RSpec.describe "subtasks/index", type: :view do
  before(:each) do
    assign(:subtasks, [
      Subtask.create!(),
      Subtask.create!()
    ])
  end

  it "renders a list of subtasks" do
    render
  end
end
