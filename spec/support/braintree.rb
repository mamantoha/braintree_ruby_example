result = Braintree::Customer.create(
  :first_name => "Big",
  :last_name => "Spender",
  :id => "663636",
  :credit_card => {
    :token => "FDJCB",
    :number => "3566007770017510",
    :expiration_date => "04/2012"
  }
)
