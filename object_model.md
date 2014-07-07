# Models
Preliminary models

## User
* has_many :dog_matches
* has_many :dogs, through: dog_matches
* name
* email
* password

## Dog
* belongs_to :shelter
* has_many :dog_matches
* has_many :users, through: dog_matches
* name
* image
* breeds
* size
* gender
* age
* description
* url

## Dog_Match
* belongs_to :user
* belongs_to :dog
* is_plus
* is_favorite

## Shelter
* has_many :dogs
* has_one :address
* name
* phone
* email
* url

## Address
* belongs_to :shelter
* address1
* address2
* city
* state
* zip
