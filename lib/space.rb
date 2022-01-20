require 'pg'
require_relative '../database_connection_setup'

class Space 

  def self.create(name:, description:, price_per_day:, available_from:, available_to:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces(name, description, price_per_day, available_from, available_to) VALUES($1, $2, $3, $4, $5) RETURNING id, name, description, price_per_day, available_from, available_to;", 
    [name, description, price_per_day, available_from, available_to]
    )

    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price_per_day: result[0]['price_per_day'], available_from: result[0]['available_from'], available_to: result[0]['available_to'])
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces;', [])

    result.map do |space|
      Space.new(id: space['id'], name: space['name'], description: space['description'], price_per_day: space['price_per_day'], available_from: space['available_from'], available_to: space['available_to'])
    end
  end   
  
  attr_reader :id, :name, :description, :price_per_day, :available_from, :available_to

  def initialize(id:, name:, description:, price_per_day:, available_from:, available_to:)
    @id = id
    @name = name
    @description = description
    @price_per_day = price_per_day
    @available_from = available_from
    @available_to = available_to
  end
end