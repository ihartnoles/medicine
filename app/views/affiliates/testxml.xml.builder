xml.instruct!
xml.affiliates do
  @affiliates.each do |affiliate|
    xml.affiliate do
      xml.znumber affiliate.znumber
      xml.fname affiliate.firstname
      xml.lname affiliate.lastname
    end
  end
 end