require "sinatra"
require "make_todo"

get "/" do
  @tasks = Tarea.all
  erb :index
end

post "/new/task" do
 @task = Tarea.create("#{params[:task]}")
 redirect "/"
end

get "/task/:id" do
@id = params[:id]
@task = Tarea.find(params[:id])
@task["done"] = true
Tarea.update(@task["id"])
redirect "/"
end

get "/task/:id/delete" do
@id = params[:id]
@task = Tarea.find(params[:id])
Tarea.destroy(@task["id"])
redirect "/"
end