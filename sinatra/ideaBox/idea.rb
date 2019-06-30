# frozen_string_literal: true

# Business Logic about an Idea
require 'yaml/store'

class Idea
  attr_reader :title, :description

  def initialize(attributes)
    @title = attributes['title']
    @description = attributes['description']
  end

  def self.all
    raw_ideas.map do |data|
      # Idea.new(data[:title], data[:description])
      Idea.new(data)
    end
  end

  def self.raw_ideas
    database.transaction do |db|
      db['ideas'] || []
    end
  end

  def self.database
    @database ||= YAML::Store.new 'ideabox'
  end

  def self.delete(position)
    database.transaction do
      database['ideas'].delete_at(position)
    end
  end

  def self.find(id)
    raw_idea = find_raw_idea(id)
    Idea.new(find_raw_idea(id))
    # Idea.new(raw_idea[:title], raw_idea[:description])
    # database.transaction do
    #    database['ideas'].at(id)
    #  end
  end

  def self.find_raw_idea(id)
    database.transaction do
      database['ideas'].at(id)
    end
  end

  def self.update(id, data)
    database.transaction do
      database['ideas'][id] = data
    end
  end

  def database
    Idea.database
  end

  def save
    # database.transaction do |db|
    #  db['ideas'] ||= []
    #  db['ideas'] << { title: title, description: description }
    #  end

    database.transaction do
      database['ideas'] ||= []
      database['ideas'] << { 'title' => title, 'description' => description }
    end
  end
end
