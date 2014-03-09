task :update_feed => :environment do
  Device.create(brand: "Fluke", description: "Foobar")
  puts "#{Device.all}"
end