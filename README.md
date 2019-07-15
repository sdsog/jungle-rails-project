# Jungle Project (Lighthouse Labs)

Project was completed as a requirement of Lighthouse Lab's Full Stack Web Development Bootcamp. Jungle is a mini e-commerce app built with Rails 4.2 for the purposes of teaching Rails by example. The project's intention was to act as a "real-world" simulation, specifically: learning a new language, ecosystem and framework on the fly. With less than a week to learn Ruby, and a two days to learn Rails after inheriting an existing code base and implementing a variety of new features.

## Features Added

- Admin Categories: allows admin to add and delete new categories
- Sold Out Badge: if product quantity is zero, displays badge and disables "add-to-cart" button
- User Authentification: allows user to create account, logout and sign-up
- Order Detail Page: if cart is empty, instructs user to keep shopping
- Email Receipt: after order, email with product details is sent with order details to user's email
- Admin Security: user must enter HTTP auth login/password to access admin pages
- Product Rating: allows registered users to rate and review products

## Screenshots

![Homepage](https://github.com/sdsog/jungle-rails-project/blob/master/screenshots/home-page.png "Homepage")
![Product Detail Page](https://github.com/sdsog/jungle-rails-project/blob/master/screenshots/product-detail-page.png "Product Detail Page")

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
