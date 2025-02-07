# credit-card-Fraud-Detection

+----------------+      +----------------+      +----------------+      +----------------+
|  cardholders   |      |  credit_cards  |      |   merchants    |      |  transactions  |
+----------------+      +----------------+      +----------------+      +----------------+
| cardholder_id  |<--+  |    card_id     |      |   merchant_id  |      | transaction_id |
| name           |   +--| cardholder_id  |      | merchant_name  |<--+  |    card_id     |
| email          |      | card_number    |      | category       |   +--|   merchant_id  |
+----------------+      +----------------+      +----------------+      |      time      |
                                                                         |     amount     |
                                                                         |     class      |
                                                                         +----------------+
