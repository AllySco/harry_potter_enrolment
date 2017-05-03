require_relative('../db/sql_runner.rb')
require_relative('house.rb')
require('pg')

class Student

  attr_reader :first_name, :second_name, :age, :id, :house_id

  def initialize(params)
    @first_name = params["first_name"]
    @second_name = params["second_name"]
    @age = params["age"].to_i if params["age"]
    @id = params["id"].to_i if params["id"]
    @house_id = params["house_id"].to_i if params["house_id"]
  end

  def save
    sql = "INSERT INTO students (first_name, second_name, age, house_id) VALUES ('#{@first_name}', '#{@second_name}', #{@age}, #{@house_id}) RETURNING id"
    student_info = SqlRunner.run(sql)
    @id = student_info.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM students WHERE id=#{ @id };"
    SqlRunner.run( sql )
  end

  def Student.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def full_name
    return "#{@first_name} #{@second_name}"
  end

  def Student.find( id )
    sql = "SELECT * FROM students WHERE id=#{id};"
    student = SqlRunner.run( sql )
    result = Student.new( student.first )
    return result
  end

  def update()
    sql = "UPDATE students SET
    first_name = '#{ @first_name }',
    second_name = '#{ @second_name }',
    age = #{ @age },
    house_id = #{ @house_id }
    WHERE id = '#{ @id }';"
    SqlRunner.run( sql )
  end

  def student_house
    sql = "SELECT name FROM houses
    WHERE id = #{@house_id};"
    results = SqlRunner.run(sql)
    house_hash = results.first()
    house_object = House.new(house_hash)
    return house_object
  end





end