# MakersBnB Project

We built a web application that allows landlords to list spaces they have available, and guests are able to hire any spaces for the night.

# User Stories

```
As a landlord
So that I can let a new space.
I want to post a new space to makersbnb.
```

```
As a landlord
So that I can let all my new spaces.
I want to post multiple spaces simultaneously to makersbnb.
```

```
As a landlord
So that I can provide details about my advertised space.
I want to provide a name, price and short description.
```

```
As a landlord
So that guests do not double book my advertised space.
I want to offer a range of dates the space is available.
```

```
As a guest
In order to have the best holiday
I want to request to book a space.
```

```
As a landlord
So that I can pick the best option
I want to be able to reject or accept an offer 
```

```
As a guest
So I don’t double book a room
I want to only book available spaces. 
```

```
As a landlord,
If a booking request hasn’t been confirmed,
I want the space to remain as available
```

### Domain Model Diagram

<div align="center">
  <img src="public/Domain Model - Frame 1.jpg" width="650">
</div>

### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

### Mockups

Mockups for MakersBnB are available [here](https://www.figma.com/file/H6ymhaCBW7Z7n7rEY8hUsV/Untitled?node-id=0%3A1).

---

