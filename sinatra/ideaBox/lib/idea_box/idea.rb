# frozen_string_literal: true

# Business Logic about an Idea
class Idea
  attr_reader :title, :description

  def initialize(attributes)
    @title = attributes['title']
    @description = attributes['description']
  end

  def database
    Idea.database
  end

  def save
    database.transaction do
      database['ideas'] ||= []
      database['ideas'] << { 'title' => title, 'description' => description }
    end
  end
end
