require 'pg'
require_relative '../database_connection_setup'

class Space 

  def self.find_by_id(id)
    space = DatabaseConnection.query("SELECT * FROM spaces WHERE id=$1", [id])[0]
    Space.new(
      id: space['id'], 
      name: space['name'], 
      description: space['description'], 
      price_per_day: space['price_per_day'], 
      available_from: space['available_from'], 
      available_to: space['available_to']
    )
  end

  #filter method that queries the BE for dates between a specific period
  def self.filter(date_to:, date_from:)
    result = DatabaseConnection.query(
      "SELECT * FROM spaces WHERE available_from <= '#{date_from}' AND available_to >= '#{date_to}';", []
      )
    result.map do |space|
      Space.new(
      id: space['id'], 
      name: space['name'], 
      description: space['description'], 
      price_per_day: space['price_per_day'], 
      available_from: space['available_from'], 
      available_to: space['available_to']
      )
    end
  end


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
      Space.new(
      id: space['id'], 
      name: space['name'], 
      description: space['description'], 
      price_per_day: space['price_per_day'], 
      available_from: space['available_from'], 
      available_to: space['available_to'])
    end
  end   

  def self.friendly_time(date)
    time.strftime('%d %b %y')
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

# we wanna see properties that match a specific criterium
# we wanna see properties available from 15/01/2022 to 20/01/2022
# feature:
#      - user goes to our listings page
#      - they pick 2 dates
#      - they are given available listings

