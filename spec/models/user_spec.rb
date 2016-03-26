describe User do
  describe "new" do

    before do
      @user = User.new(:first_name => "kevin", :last_name => "luu")
    end

    describe "user" do
      it "saves correct first and last name" do
        expect(@user.first_name).to eql("kevin")
        expect(@user.last_name).to eql("luu")
      end 
    end

    describe "email" do
      it "saves good email address" do
        count = @user.email_address.count.to_i
        email = @user.email_address.new(:email_address => "test@test.com")
        email.save
        expect(count+1).to eql(@user.email_address.count.to_i)
        expect(email.email_address).to eql("test@test.com")
      end
      it "doesn't save bad email address" do
        count = @user.email_address.count.to_i
        @user.email_address.new(:email_address => '').save
        expect(count).to eql(@user.email_address.count.to_i)
      end
    end

    describe "phonenumber" do
      it "saves good phone numbers" do
        count = @user.phone_numbers.count.to_i
        phone_number = @user.phone_numbers.new(:area_code => 111, :phone_number => 1234567, :label => "home")
        phone_number.save
        expect(count+1).to eql(@user.phone_numbers.count.to_i)
        expect(phone_number.area_code).to eql(111)
        expect(phone_number.phone_number).to eql(1234567)
        expect(phone_number.label).to eql("home")
      end
      it "doesn't save phone numbers with bad area code" do
        count = @user.phone_numbers.count.to_i
        @user.phone_numbers.new(:area_code => 11, :phone_number => 1234567, :label => "home").save;
        expect(count).to eql(@user.phone_numbers.count.to_i)
      end
      it "doesn't save phone numbers with bad phone number" do
        count = @user.phone_numbers.count.to_i
        @user.phone_numbers.new(:area_code => 111, :phone_number => 123456, :label => "home").save;
        expect(count).to eql(@user.phone_numbers.count.to_i)
      end
      it "doesn't save phone numbers with bad label" do
        count = @user.phone_numbers.count.to_i
        @user.phone_numbers.new(:area_code => 111, :phone_number => 1234567, :label => "blah").save;
        expect(count).to eql(@user.phone_numbers.count.to_i)

      end
    end

    describe "address" do
      it "saves good address" do
        count = @user.address.count.to_i
        address = @user.address.new(:street => "123 N. Fake St.", :city => "Fake City", :state => "CA", :zip_code => 12345);
        address.save
        expect(count+1).to eql(@user.address.count.to_i)
        expect(address.street).to eql("123 N. Fake St.")
        expect(address.city).to eql("Fake City")
        expect(address.state).to eql("CA")
        expect(address.zip_code).to eql(12345)
      end
      it "doesn't save address with bad street" do
        count = @user.address.count.to_i
        address = @user.address.new(:street => "", :city => "Fake City", :state => "CA", :zip_code => 12345);
        address.save
        expect(count).to eql(@user.address.count.to_i)
      end
      it "doesn't save address with bad state" do
        count = @user.address.count.to_i
        address = @user.address.new(:street => "123 N. Fake St.", :city => "Fake City", :state => "", :zip_code => 12345);
        address.save
        expect(count).to eql(@user.address.count.to_i)
      end
      it "doesn't save address with bad city" do
        count = @user.address.count.to_i
        address = @user.address.new(:street => "123 N. Fake St.", :city => "", :state => "CA", :zip_code => 12345);
        address.save
        expect(count).to eql(@user.address.count.to_i)
      end
      it "doesn't save address with bad zip code" do
        count = @user.address.count.to_i
        address = @user.address.new(:street => "123 N. Fake St.", :city => "Fake City", :state => "CA", :zip_code => 1);
        address.save
        expect(count).to eql(@user.address.count.to_i)
      end
    end


  end

end
