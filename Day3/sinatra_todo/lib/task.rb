
require 'rspec'
require 'yaml/store'

class Task
  attr_reader :content, :id, :completed, :created_at, :update_at

  @@current_id = 1

  def initialize(content, completed = false)
    @id = @@current_id
    @content = content
    @@current_id += 1
    @completed = false
    @created_at = Time.now
    @update_at = nil
  end

  def complete?
    @completed
  end

  def complete!
    @completed = true
  end

  def make_incomplete!
    @completed = false
  end
  def update_content!(new_content)
    @content = new_content
    @update_at = Time.now
  end
end
