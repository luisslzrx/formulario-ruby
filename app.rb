require 'sinatra'
require 'pony'

get '/' do
  erb :formulario
end

post '/submit' do
  nombre = params[:nombre]
  email = params[:email]

  Pony.mail(
    to: 'luisgerdx521@gmail.com',      # correo destino donde quieres recibir el mensaje
    from: email,                      # correo remitente (del formulario)
    subject: "Nuevo mensaje de #{nombre}",
    body: "Has recibido un mensaje de #{nombre} con el correo: #{email}",
    via: :smtp,
    via_options: {
      address: 'smtp.gmail.com',
      port: '587',
      enable_starttls_auto: true,
      user_name: 'luisgerdx521@gmail.com',      # tu correo para autenticar SMTP
      password: 'wwju agtg otio miex',              # tu contraseña o app password
      authentication: :plain,
      domain: "localhost.localdomain"
    }
  )

  "¡Gracias #{nombre}! Hemos enviado tu correo."
end
