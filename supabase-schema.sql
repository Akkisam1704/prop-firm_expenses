-- Run in the Supabase SQL Editor. Enable email OTP in Authentication settings.
create table if not exists public.prop_ledger_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"firms":["Topstep","Lucid Trading"],"transactions":[],"accounts":[],"trades":[],"currency":"USD"}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.prop_ledger_data enable row level security;
drop policy if exists "read own ledger" on public.prop_ledger_data;
create policy "read own ledger" on public.prop_ledger_data for select to authenticated using (auth.uid() = user_id);
drop policy if exists "insert own ledger" on public.prop_ledger_data;
create policy "insert own ledger" on public.prop_ledger_data for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "update own ledger" on public.prop_ledger_data;
create policy "update own ledger" on public.prop_ledger_data for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
grant select, insert, update on public.prop_ledger_data to authenticated;
