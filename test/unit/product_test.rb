require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products
  
  test "products properties must not be empty" do
  	product=Product.new
  	assert product.invalid?
  	assert product.errors[:title].any? 
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?
  end
  
  test "product price must be possitive" do
  	product=Product.new(
  			:title => "It is something",
  			:description => "yolo",
  			:image_url => "aas.gif"
  		)
  	product.price = -1
  	assert product.invalid?
  	assert_equal "must be greater than or equal to 0.01",
  	product.errors[:price].join('; ')

  	product.price = 1 
  	assert product.valid?
  end
  
  def new_product(image_url)
    Product.new(title:        "My New Book Title",
                description:  "Something noticable",
                price:        1, 
                image_url:    image_url)
  end
  
  test "image url" do
    good = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg 
              http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more}
    
    good.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end
    
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} should not be valid"
    end  
  end  
  
  test "product is not valid without a valid title " do
    product = Product.new(title: products(:ruby).title,
                          description: products(:ruby).description,
                          price: 1,
                          image_url: "fred.gif")
    assert !product.save
    assert_equal  I18n.translate('activerecord.errors.messages.taken'), 
                  product.errors[:title].join('; ')
  end           
end
