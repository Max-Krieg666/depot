desc "Создание 3 пользователей с разными правами"
namespace :users do
  task :create=>:environment do
    us1=User.create(email: "admin@admin.ru",
                 password: "adminadmin",
                 phone_number: "1234567890",
                 adress: "Moscow", role: 2)
    us2=User.create(email: "moderator@moderator.ru",
                    password: "moderator",
                    phone_number: "8888777665",
                    adress: "Ladoga", role: 1)
    us3=User.create(email: "user@user.ru",
                    password: "useruser",
                    phone_number: "0987656789",
                    adress: "Yakutsk", role: 0)
  end
end
