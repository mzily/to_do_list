require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:valid_attributes) {
    {
      task: 'Make ToDo list',
      deadline: Date.current,
    }
  }

  it 'is valid with valid attributes' do
    expect(Todo.new(valid_attributes)).to be_valid
  end

  describe 'ToDo task' do
    it 'is invalid if task is empty' do
      valid_attributes[:task] = nil

      expect(Todo.new(valid_attributes)).to_not be_valid
    end

    it 'is invalid if task is an empty string' do
      valid_attributes[:task] = ""

      expect(Todo.new(valid_attributes)).to_not be_valid
    end
  end

  describe 'ToDo deadline' do
    it 'is invalid if deadline is empty' do
      valid_attributes[:deadline] = nil

      expect(Todo.new(valid_attributes)).to_not be_valid
    end

    it 'is invalid if deadline is not a Date object' do
      valid_attributes[:deadline] = "1234"

      expect(Todo.new(valid_attributes)).to_not be_valid
    end
  end

  describe 'ToDo completed' do
    it 'instantiates to a default value of false' do
      expect(Todo.new(valid_attributes).completed).to eq(false)
    end

    it 'is invalid if completed is not present' do
      valid_attributes[:completed] = nil

      expect(Todo.new(valid_attributes)).to_not be_valid
    end
  end
end
