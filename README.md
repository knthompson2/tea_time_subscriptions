# Tea-Time Subscriptions

## Table of contents
- [Overview](#overview)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Schema](#schema)
- [Technologies](#technologies)
- [Contributors](#contributors)

### Overview

Tea-Time Subscriptions is an API service that allows customers to create and cancel tea subscriptions. 

## Setup

This project requires Ruby 2.7.2 and Rails 6.1.4.
- Fork this repository
- Install gems and set up your database:
  - `bundle`  
  - `rails db:{drop,create,migrate}` 
  - Run the test suite with:  `bundle exec rspec` 
  - Run your development server with: `rails s`

### Endpoints

The `base path` of each enpoint is:

  http://localhost:3000/api/v1
  
  - For `GET` requests, you can send the endpoint request through your internet browser or use an API client such as [Postman](postman).
  - For `POST` requests, you must use an API client to provide the information in the request body. 


#### Create a customer tea subscription

`POST /customers/:id/subscriptions`

Example JSON response:

```
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 4,
            "title": "Eucalyptus Tea - monthly",
            "price": 19.99,
            "status": "active",
            "frequency": "monthly"
        }
    }
}
```

#### Cancel a customer tea subscription

`PATCH /customers/:id/subscriptions/:subscription_id`

Updates the status of the subscrition from active to canceled.

Example JSON response:

```
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 4,
            "title": "Eucalyptus Tea - monthly",
            "price": 19.99,
            "status": "active",
            "frequency": "monthly"
        }
    }
}
```

#### Get all subscriptions for a customer

`GET /customers/:id/subscriptions`

Returns a list of all of a customer's tea subscriptions, regardless of subscription status. 


Example JSON response:

```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 1,
                "title": "Lavendar - quarterly",
                "price": 7.99,
                "status": "canceled",
                "frequency": "quarterly"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 2,
                "title": "Lavendar - quarterly",
                "price": 7.99,
                "status": "active",
                "frequency": "quarterly"
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 3,
                "title": "Lavendar - quarterly",
                "price": 12.99,
                "status": "canceled",
                "frequency": "monthly"
            }
        },
        {
            "id": "4",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 4,
                "title": "Eucalyptus Tea - monthly",
                "price": 19.99,
                "status": "canceled",
                "frequency": "monthly"
            }
        }
    ]
}

```

### Schema
![Screen Shot 2022-01-07 at 6 17 12 AM](https://user-images.githubusercontent.com/84689917/148549484-4c84b8be-456f-4067-bbc6-a632196874aa.png)

### Technologies

#### Versions
- Ruby 2.7.2
- Rails 6.1.4

#### Development
![Ruby on Rails][ruby-on-rails-badge]
![Git][git-badge]
![Atom][atom-badge]
![Postico][postico-badge]
![Postman][postman-badge]

#### Languages
![Ruby][ruby-badge]
![ActiveRecord][activerecord-badge]

#### Testing
![RSpec][rspec-badge]
![Simplecov][simplecov-badge]
![Pry][pry-badge]
![Capybara][capybara-badge]
![Launchy][launchy-badge]
![Shoulda Matchers][shoulda-matchers-badge]

#### Development Principles
![OOP][oop-badge]
![TDD][tdd-badge]
![MVC][mvc-badge]
![REST][rest-badge]


### Contributors
👤  **Kelsey Thompson**
![LinkedIn][linkedin-badge](https://www.linkedin.com/in/knthompson2/)
![Github][github-badge]](https://github.com/knthompson2)


<!-- Markdown link & img dfn's -->
[linkedin-badge]:         https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white

[atom-badge]:             https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white
[git-badge]:              https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white
[markdown-badge]:         https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white
[postgreSQL-badge]:       https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white
[postico-badge]:          https://img.shields.io/badge/postico-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[postman-badge]:          https://img.shields.io/badge/Postman-FF6C37?style=flat&logo=Postman&logoColor=white
[ruby-on-rails-badge]:    https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white

<!-- Languages -->
[activerecord-badge]:     https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white
[ruby-badge]:             https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white

<!-- Deployment -->

<!-- Testing -->
[capybara-badge]:         https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[launchy-badge]:          https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[pry-badge]:              https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[rspec-badge]:            https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[shoulda-matchers-badge]: https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[simplecov-badge]:        https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white

<!-- Development Principles -->
[oop-badge]:              https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white
[tdd-badge]:              https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white
[mvc-badge]:              https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white
[rest-badge]:             https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white
