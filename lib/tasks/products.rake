desc "Генерация 45 продуктов"
namespace :products do
  task :create=>:environment do
    45.times do |i|
      p=Product.new(name: "Товар #{i+1}",
                    price: rand(1.0e6)/1000+1,
                    weight: rand(3000)+1)
      p.description="Lorem ipsum #{rand(1000)+1}..."
      p.save!
    end
  end
end
