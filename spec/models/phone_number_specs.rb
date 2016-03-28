describe PhoneNumbers do

  describe "new" do
    before do
      @user = User.new(first_name:  "kevin", last_name:  "luu")
    end

    describe "phone_number" do
      it "can search by label" do
        phone_number= @user.phone_numbers.new(label: "home", area_code: 123, phone_number: 1234567)
        phone_number.save
        expect(PhoneNumbers.by_label "home").to include(phone_number)
        expect(PhoneNumbers.by_label "homee").to_not include(phone_number)
      end 
    end
  end
end
