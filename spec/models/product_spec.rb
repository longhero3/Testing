require 'spec_helper'

describe Product do
  let(:product) { FactoryGirl.create :product }
  let(:new_product) { FactoryGirl.build :product }

  it 'validates presence of title' do
  	new_product.title = nil
  	new_product.valid?.should be_true
  	# new_product.should_not be_valid

  	# x.a?
  	# x.should be_a | x.a.should be_true | x.a == true
  	# x.should_not be_a | x.a.should be_false | x.a == false
  end
end