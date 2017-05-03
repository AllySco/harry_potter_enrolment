require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/student.rb')
require_relative('models/house.rb')

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  erb(:new)
end

get "/students/:id" do 
  @student = Student.find(params[:id])
  erb(:show)
end

post "/students" do
  @student = Student.new(params)
  @student.save
  erb(:create)
end


get '/students/:id/edit' do
  @student = Student.find(params[:id])
  erb(:edit)
end

post '/students/:id' do
  @student = Student.new(params)
  @student.update()
  erb(:update)
end

post '/students/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete()
  erb(:destroy)
end

