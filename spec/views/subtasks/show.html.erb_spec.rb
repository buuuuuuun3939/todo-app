require 'rails_helper'

RSpec.describe "subtasks/show", type: :view do
  before(:each) do
    @subtask = assign(:subtask, Subtask.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
