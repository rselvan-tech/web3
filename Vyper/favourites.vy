#pragma version 0.4.0
#@license MIT

my_favorite_number: uint256

@external 
def store(new_num: uint256):
    self.my_favorite_number = new_num

@external
@view 
def read() -> uint256:
    return self.my_favorite_number

