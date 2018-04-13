require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "User is a class" do
    expect(User).to be_a(Class) 
  end

  it "Creates a User instance and saves it" do
    user1 = User.new(firstname:"Baudouin", lastname:"Baudrier", email:"a@a.a", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).to eq([]) 
  end

  it "Accepts a valid email" do
    user1 = User.new(firstname:"Baudouin", lastname:"Baudrier", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save 
    expect(user1.errors.full_messages).to eq([]) 
  end
  
  it "Rejects an invalid email" do
    user1 = User.new(firstname:"Baudouin", lastname:"Baudrier", email:"salut", password:"coucou", password_confirmation:"coucou")
    expect(user1.valid?).to be false
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
  end

  it "Accepts a valid firstname" do
    user1 = User.new(firstname:"Baudouin", lastname:"Baudrier", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save 
    expect(user1.errors.full_messages).to eq([]) 
  end
  
  it "Rejects an invalid firstname" do
    user1 = User.new(firstname:"8", lastname:"Baudrier", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
    
    user1 = User.new(firstname:"A", lastname:"Baudrier", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
    
    user1 = User.new(firstname:"", lastname:"Baudrier", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
    
    toolongname = "qwerqoeiruqwieueirueiuqriwueriqwueriuweriuweirueirueirueirueiurieureiurieurieurieurieurieurieur"
    user1 = User.new(firstname:toolongname, lastname:"Baudrier", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
  end
  
  it "Rejects an invalid lastname" do
    user1 = User.new(firstname:"Baudouin", lastname:"8", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
    
    user1 = User.new(firstname:"Baudouin", lastname:"A", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
    
    user1 = User.new(firstname:"Baudouin", lastname:"", email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
    
    toolonglastname = "qwerqoeiruqwieueirueiuqriwueriqwueriuweriuweirueirueirueirueiurieureiurieurieurieurieurieurieur"
    user1 = User.new(firstname:"Baudouin", lastname:toolonglastname, email:"r@r.r", password:"coucou", password_confirmation:"coucou")
    user1.save
    expect(user1.errors.full_messages).not_to eq([]) 
  end

end
