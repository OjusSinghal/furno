def get_buyer_id(firstName, dob, email, gender):
    buyerID = "b" + firstName[:2] + dob[8:10] + email[:4] + gender

    return buyerID.lower()

def get_seller_id(name, contact, email):
    sellerID = "s" + name[:2] + contact[:2] + email[:5]
    return sellerID.lower()