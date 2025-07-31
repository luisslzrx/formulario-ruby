# Requerimos Sinatra para crear la app web
require 'sinatra'

# Ruta GET para mostrar el formulario
get '/' do
  erb :formulario
end

# Ruta POST para procesar datos enviados desde el formulario
post '/submit' do
  nombre = params[:nombre]
  email = params[:email]

  "¡Gracias #{nombre}! Hemos recibido tu correo: #{email}"
end
