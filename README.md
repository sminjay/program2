# CSC517_Program_2

This is a Ruby on Rails application for a **Movie Ticketing System**. The system lets users to navigate through movies, book tickets, and view their booking history. Admins can manage users, movies, shows, and tickets.

### Key Features:
- **User Features**:
  - Sign up and log in.
  - Browse available shows and movies.
  - Purchase tickets for movies that are released.
  - View and cancel booked tickets.
  - Edit and delete their profile.

- **Admin Features**:
  - Log in with predefined credentials.
  - Manage users, movies, shows, and tickets.
  - View all users, movies, and tickets.
  - Edit their profile (but not delete the admin account).

---
## Video Demo

https://github.ncsu.edu/jshah26/CSC517_Program_2/assets/35827/5cfb55f0-21eb-49e3-a2e8-d4f184a19fdc



## Getting Started

### Prerequisites
- Ruby version 2.6.X or above.
- Rails version 6.X or above.
- PostgreSQL or any other database supported by Rails.

### Installation
1. Clone the repository:
     git clone https://github.ncsu.edu/jshah26/CSC517_Program_2.git
     cd CSC517_Program_2

3. Install Dependencies:
     bundle install
   
4. Set up the database:
     rails db:create
     rails db:migrate
     rails db:seed
   
5. Start the rails server:
     rails server
  
6. Access the application in your browser at http://localhost:3000

# Movie Ticketing System - Ruby on Rails Application

## Accessing the Application

### Admin Credentials
- **Username**: `sjs@cinepack.com`
- **Password**: `password242511`

### User Registration
- Users can sign up by clicking the **Sign Up** link on the homepage.
- After signing up, users can log in using their credentials.

---

## Testing Features

### User Features
1. **Sign Up**:
   - Click on **Sign Up** on the homepage.
   - Fill in the required details (username, name, email, password, phone number, address).
   - Click **Submit** to create an account.

2. **Log In**:
   - Click on **Log In** on the homepage.
   - Enter your username and password.
   - Click **Submit** to log in.

3. **Browse Movies**:
   - After logging in, click on **Movies** on the homepage.
   - You will see a list of available movies with details (title, genre, duration, language, rating, release date)

4. **Browse Shows**:
   - After logging in, click on **Movies** on the homepage.
   - Under each movie you will see the available shows for that specific movie. The shows that have zero available seats would not be displayed

4. **Book a Ticket**:
   - Click on a movie from the list.
   - Select a showtime with available seats.
   - Click **Book Ticket**.
   - Fill the form to book the ticket
   - Total charges would be shown to the user.  


5. **View Booking History**:
   - Click on **My Tickets** on the user dashboard.
   - You will see a list of all tickets booked by you.
   - The number of available seats will decrease when a ticket is booked.

6. **Cancel a Ticket**:
   - Go to **View Tickets**.
   - There you can Click **Cancel** for the ticket you want to cancel.
   - The ticket status will be updated to "Cancelled," and the seats will be released.

7. **Edit Profile**:
   - Click on **Profile** on the user dashboard.
   - Update your details (except ID).
   - Click **Save** to update your profile.

8. **Delete Account**:
   - Click on **Profile** on the user dashboard.
   - Click **Delete Account** to permanently remove your account.
  
9.  Users would not be able to access resources by changing the URL

### Admin Features
1. **Log In**:
   - Click on **Admin Log In** on the homepage.
   - Enter the admin credentials (provided above).
   - Click **Submit** to log in.

2. **Manage Users**:
   - Click on **Manage Users** on the admin dashboard.
   - You can view the users, and by clicking on "Show this User," you can edit or delete them.

3. **Manage Movies**:
   - Click on **Manage Movies** on the admin dashboard.
   - You can view the movies, and by clicking on "Show this movie," you can edit or delete them.
   - If a movie is deleted, then the shows associated it would also be deleted

4. **Manage Shows**:
   - Click on **Manage Shows** on the admin dashboard.
   - You can view the shows, and by clicking on "Show this show," you can edit or delete them.

5. **Manage Tickets**:
   - Click on **Manage Tickets** on the admin dashboard.
   - You can view or delete tickets.

6. **Edit Admin Profile**:
   - Click on **Profile** on the admin dashboard.
   - Update your details (except ID, username, and password).
   - Click **Save** to update your profile.

---

## Deployment

The application is deployed on **<deployment-platform>** and can be accessed at:
- **Deployed Application URL**: `152.7.178.125:3000`

---

## Testing (RSpec)

### Model Testing
- The `User` model has been thoroughly tested using RSpec.
- To run the tests:
  rspec spec/models/user_spec.rb

### Controller Testing
- The MoviesController has been thoroughly tested using RSpec.
- To run the test:
  rspec spec/controllers/movies_controller_spec.rb
