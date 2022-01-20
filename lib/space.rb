require 'pg'
require_relative '../database_connection_setup'

class Space 

  def self.create(name:, description:, price_per_day:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces(name, description, price_per_day) VALUES($1, $2, $3) RETURNING id, name, description, price_per_day;", 
    [name, description, price_per_day]
    )

    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price_per_day: result[0]['price_per_day'])
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces;', [])

    result.map do |space|
      Space.new(id: space['id'], name: space['name'], description: space['description'], price_per_day: space['price_per_day'])
    end
  end   
  
  attr_reader :id, :name, :description, :price_per_day

  def initialize(id:, name:, description:, price_per_day:)
    @id = id
    @name = name
    @description = description
    @price_per_day = price_per_day
  end
end