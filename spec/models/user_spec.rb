require 'rails_helper'
# t.string :first_name
#       t.string :last_name
#       t.string :email
#       t.string :password_digest

#       t.timestamps null: false
RSpec.describe User, type: :model do
  describe 'Validations' do
    subject{
      existingUser =  User.create(first_name: "firstname",last_name:"lastname",email: "blah@gmail.com",password: "123456",password_confirmation: "123456");
      existingUser.save
      newUser =  described_class.new(first_name: "TH",last_name:"AR", email: "th@gmail.com",password: "123456",password_confirmation: "123456");
    }

    it 'should be valid if everything provided' do
      expect(subject).to be_valid
    end

    it 'should not be valid if no password provided' do
      subject.password = nil;
      expect(subject).to_not be_valid
    end

    it 'should not be valid if no password confirmation provided' do
      subject.password_confirmation = nil;
      expect(subject).to_not be_valid
    end

    it 'should not be valid if password and confirmation do not match' do
      subject.password_confirmation = "123";
      subject.password = "1233";
      expect(subject).to_not be_valid
    end

    it 'should not be valid if email is taken' do
      subject.email = "blah@gmail.com";
      expect(subject).to_not be_valid
    end

    it 'should not be valid if email is taken (case insensitive)' do
      subject.email = "bLaH@gMaIl.CoM";
      expect(subject).to_not be_valid
    end

    it 'should not be valid if no first name provided' do
      subject.first_name = nil;
      expect(subject).to_not be_valid
    end

    it 'should not be valid if no last name provided' do
      subject.last_name = nil;
      expect(subject).to_not be_valid
    end

    it 'should not be valid if no email  provided' do
      subject.email = nil;
      expect(subject).to_not be_valid
    end

    it 'should not be valid if password is too short' do
      subject.password = "12";
      subject.password_confirmation = "12";
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    subject{
      newUser =  described_class.new(first_name: "TH",last_name:"AR", email: "th@gmail.com",password: "123456",password_confirmation: "123456");

    }

    it 'should find a user when provided the email and password' do
      subject.save
      myuser = User.authenticate_with_credentials("th@gmail.com","123456")
      expect(myuser).to eql subject
    end

    it 'should return nil if provided a valid email and invalid password' do
      subject.save
      myuser = User.authenticate_with_credentials("th@gmail.com","1")
      expect(myuser).to be nil
    end

    it 'should return nil if provided an invalid email and password' do
      subject.save
      myuser = User.authenticate_with_credentials("the@gmail.com","123456")
      expect(myuser).to be nil
    end

    it 'should find a user even if there are spaces in front of the username' do
      subject.save
      myuser = User.authenticate_with_credentials("  th@gmail.com","123456")
      expect(myuser).to eql subject
    end

    it 'should find a user even if there are spaces in front of the username' do
      subject.save
      myuser = User.authenticate_with_credentials("Th@GmAiL.com","123456")
      expect(myuser).to eql subject
    end


  end


end
