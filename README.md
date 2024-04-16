# Loyalty Application


[![Branch Status](https://img.shields.io/github/last-commit/johnarriesgado/loyalty_app)](https://github.com/johnarriesgado/loyalty_app//branches)

At it's most basic, the platform offers clients the ability to issue loyalty points to their end users. End users use their points to claim/purchase rewards offered by the client.

## Usage

To use the application, follow these steps:

1. Clone this repository to your local machine.
```
git clone https://github.com/johnarriesgado/loyalty_app.git
```

2. Navigate to the project directory.
```
cd loyalty_app
```

3. Run the application using the following commands:
```
rails start
```

### Endpoints

## Transaction Endpoint

### Point Earning Rules

When a transaction is created, the end user earns loyalty points based on the following rules:

- For every $100 the end user spends, they receive 10 points.
- If the end user spends any amount of money in a foreign country, they receive 2 times the standard points.

### Usage

To create a new transaction, make a POST request to the `/transactions` endpoint with the following parameters:

- `amount`: The amount of money spent in the transaction.
- `currency`: The currency used for the transaction. (Optional, default: US Dollar)

Example request:

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"amount": 150, "currency": "Euro"}' \
  http://localhost:3000/transactions
  ```

To create a new transaction, make a POST request to the `/transactions` endpoint with the following parameters:

- `amount`: The amount of money spent in the transaction.
- `currency`: The currency used for the transaction. (Optional, default: US Dollar)

Example Response

```bash
{
  "id": 1,
  "amount": 100,
  "points_earned": 20,
  "created_at": "2024-04-18T12:00:00Z",
  "updated_at": "2024-04-18T12:00:00Z"
}
```

## Customer Endpoint

### Customer Details

The customer endpoint allows you to retrieve information about a specific customer, including their loyalty tier, current points, maximum points, and rewards.

### Usage

To retrieve information about a customer, make a GET request to the `/customers/:id` endpoint, where `:id` is the ID of the customer.

Example request:

```bash
curl -X GET \
  http://localhost:3000/customers/1
```

Example response:

```bash
{
  "id": 1,
  "full_name": "John Doe",
  "birthday": "1990-01-01",
  "loyalty_tier": "Gold",
  "current_points": 2500,
  "max_points": 3000,
  "rewards": [
    {
      "name": "Free Coffee",
      "qty": 1,
      "redeemed_qty": 0
    },
    {
      "name": "Free Movie Tickets",
      "qty": 2,
      "redeemed_qty": 1
    }
  ]
}
```
#### Loyalty Tier Thresholds
- A standard tier customer is an end user who accumulates 0 points
- A gold tier customer is an end user who accumulates 1000 points
- A platinum tier customer is an end user who accumulates 5000 points


## Features
- User Management: Clients can create and manage user accounts.
- Points Issuance: Clients can issue loyalty points to users based on predefined rules.
- Reward Redemption: Users can redeem their points for rewards offered by the client.
- Transaction Tracking: The application tracks all user transactions, including points earned and redeemed.
- Tier Management: Users can be assigned to different loyalty tiers based on their activity and points earned.
- Flexible Configuration: Clients can customize loyalty program rules, reward offerings, and more.

## Technologies Used
- Ruby on Rails: Backend framework for building web applications.
- SQLite: Lightweight relational database used for development.
- Git: Version control system for tracking changes in the codebase.


### TODO
- Add more details to Customer Show endpoint
- Add Issuing Rewards Rules
- ADD Background Job TO Manage Loyalty Rewards