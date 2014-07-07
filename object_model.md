# Models
Preliminary models

## User
* has_many :dogs
* name
* email
* password

## Dogs
* belongs_to :user
* belongs_to :shelter
* name
* image
* breed
* size
* gender
* age
* description
* url

## Shelters
* has_many :dogs
* has_one :address
* name
* number
* address
* url

## Address
* belongs_to :shelter
* street_number
* street_name
* city
* state
* zip
