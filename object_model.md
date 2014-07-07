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
* breeds
* size
* gender
* age
* description
* url
* is_favorite

## Shelters
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
