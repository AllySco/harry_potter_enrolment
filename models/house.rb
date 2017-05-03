require_relative('../db/sql_runner.rb')
require('pg')

class House

  attr_reader :name, :id

  def initialize(params)
    @name = params["name"]
    @id = params["id"].to_i if params["id"]
  end

  def save
    sql = "INSERT INTO houses (name) VALUES ('#{@name}') RETURNING id;"
    house_info = SqlRunner.run(sql)
    @id = house_info.first()["id"].to_i
  end

  
  def House.all()
    sql = "SELECT * FROM houses;"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def House.find( id )
    sql = "SELECT * FROM houses WHERE id=#{id};"
    house = SqlRunner.run( sql )
    result = House.new( house.first )

    return result
  end


end