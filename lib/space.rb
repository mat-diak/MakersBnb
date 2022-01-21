require 'pg'
require 'date'
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
      available_to: space['available_to'],
      user_id: space['user_id']
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
      available_to: space['available_to'],
      user_id: space['user_id']
      )
    end
  end


  def self.create(name:, description:, price_per_day:, available_from:, available_to:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces(name, description, price_per_day, available_from, available_to, user_id) VALUES($1, $2, $3, $4, $5, $6) RETURNING id, name, description, price_per_day, available_from, available_to, user_id;", 
    [name, description, price_per_day, available_from, available_to, user_id]
    )

    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price_per_day: result[0]['price_per_day'], available_from: result[0]['available_from'], available_to: result[0]['available_to'], user_id: result[0]['user_id'])
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
      available_to: space['available_to'],
      user_id: space['user_id'])
    end
  end   
  
  attr_reader :id, :name, :description, :price_per_day, :available_from, :available_to

  def initialize(id:, name:, description:, price_per_day:, available_from:, available_to:, user_id:)
    @id = id
    @name = name
    @description = description
    @price_per_day = price_per_day
    @available_from = available_from
    @available_to = available_to
    @user_id = user_id
  end
end

# we wanna see properties that match a specific criterium
# we wanna see properties available from 15/01/2022 to 20/01/2022
# feature:
#      - user goes to our listings page
#      - they pick 2 dates
#      - they are given available listings

