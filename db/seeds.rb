# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
types = ProductType.create([
    {title: "T-shirts"},
    {title: "Trousers"},
    {title: "Suits"},
    {title: "Underwears"},
    {title: "Shoes"}
    ])

colors = ProductColor.create([
    {color: "Red",
    code: "FF0000"},
    {color: "Green",
    code: "00FF00"},
    {color: "Blue",
    code: "0000FF"},
    {color: "White",
    code: "FFFFFF"},
    {color: "Black",
    code: "000000"}
    ])
    
sizes = ProductSize.create([
    {size: "XS"},
    {size: "S"},
    {size: "M"},
    {size: "L"},
    {size: "XL"}
    ])
    
100.times do
    product = types[Random.rand(4)].products.create(
        serial: Faker::Code.ean,
        title: Faker::Commerce.product_name,
        description: Faker::ChuckNorris.fact,
        price: Faker::Commerce.price,
        sale: 0,
        gender: Faker::Boolean.boolean
        )
    10.times do
        variety = product.product_varieties.create(
            product_color: colors[Random.rand(4)],
            product_size: sizes[Random.rand(4)],
            cost: Faker::Commerce.price,
            tariff: Faker::Number.decimal(2),
            sold_price: Faker::Commerce.price,
            sold_tariff: Faker::Number.decimal(2)
            )
        5.times do
            variety.product_images.create(
                url: Faker::Placeholdit.image("50x50", 'jpg'),
                title: Faker::Pokemon.name,
                description: Faker::Pokemon.location
                )
        end
    end
end