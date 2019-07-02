# frozen_string_literal: true

# Business Logic about an Idea
class Idea
  include Comparable
  attr_reader :title, :description, :rank, :id

  def initialize(attributes = {})
    @title = attributes['title']
    @description = attributes['description']
    @rank = attributes['rank'] || 0
    @id = attributes['id']
  end

  def database
    Idea.database
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end

  def save
    # database.transaction do
    #  database['ideas'] ||= []
    #  database['ideas'] << { 'title' => title, 'description' => description }
    # end
    # IdeaStore.create("title" => title, "description" => description, "rank" => rank)
    IdeaStore.create(to_h)
  end

  def to_h
    {
      'title' => title,
      'description' => description,
      'rank' => rank
    }
  end
end
