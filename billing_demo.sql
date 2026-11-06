-- Billing demo: a small invoices table and the queries a billing
-- support specialist uses to investigate payment issues.

create table invoices (
  id bigint generated always as identity primary key,
  customer text not null,
  plan text not null,
  amount numeric(10,2) not null,
  status text not null,          -- paid, unpaid, failed
  due_date date not null
);

alter table invoices enable row level security;

insert into invoices (customer, plan, amount, status, due_date) values
  ('Acme ApS',       'Pro',  25.00,  'paid',   '2026-10-01'),
  ('Nordic Apps',    'Pro',  25.00,  'failed', '2026-10-05'),
  ('Prague Studio',  'Team', 599.00, 'unpaid', '2026-10-15'),
  ('Acme ApS',       'Pro',  25.00,  'unpaid', '2026-11-01'),
  ('Copenhagen Dev', 'Free', 0.00,   'paid',   '2026-11-01');

-- Which payments failed?
select customer, plan, amount, due_date
from invoices
where status = 'failed';

-- How much is still outstanding, per customer?
select customer, sum(amount) as total_outstanding
from invoices
where status in ('unpaid', 'failed')
group by customer
order by total_outstanding desc;

-- Which invoices are overdue?
select *
from invoices
where status <> 'paid' and due_date < current_date;
