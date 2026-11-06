# Supabase Billing Demo

A small practice project I built while preparing for billing support roles.
It models customer invoices in a Supabase (PostgreSQL) database and uses SQL
to answer the questions a billing support specialist deals with every day.

## What it covers
- Creating an `invoices` table with plans, amounts, payment status and due dates
- Enabling Row Level Security (RLS) on the table
- Finding failed payments
- Calculating outstanding balances per customer
- Listing overdue invoices

## How to run it
1. Create a free project at [supabase.com](https://supabase.com)
2. Open the **SQL Editor**
3. Paste in `billing_demo.sql` and click **Run**

## Tools
Supabase · PostgreSQL · SQL Editor · Row Level Security

---
Thomas Krogh · [LinkedIn](https://www.linkedin.com/in/thomaskroghdk)
