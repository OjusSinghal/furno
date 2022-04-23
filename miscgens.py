def get_buyer_id(firstName, dob, email, gender):
    buyerID = "b" + firstName[:2] + dob[8:10] + email[:4] + gender

    return buyerID.lower()
