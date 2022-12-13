Rails.configuration.stripe = { 
    :publishable_key => 'pk_test_51MA2XxLFQu7F5KVbUUT8HQHDbMbgfJsSaqb7QLQ7gOLY33S9HMp14v5C3oM977wz8im80V3wydrGUQAu4w4GcGjM001LEIYVEJ', 
    :secret_key => 'sk_test_51MA2XxLFQu7F5KVbzeELWoGQJseEpJVj7iwsWWhquXTWdFenPsCJFcoCmUkKoDNMj6mFfHOpHv4bBiHXUtnYMRv9007TQg6Smz'
} 

Stripe.api_key = Rails.configuration.stripe[:secret_key]

