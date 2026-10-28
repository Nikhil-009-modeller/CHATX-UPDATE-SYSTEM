-- CHAT X Update System database setup.
-- Replace admin@example.com with your exact admin email before running.
create table if not exists public.app_updates (
 id uuid primary key default gen_random_uuid(),
 app_id text not null default 'CHATX',
 app_name text not null default 'CHAT X',
 version_name text not null,
 version_code integer not null check (version_code > 0),
 min_version_code integer not null default 1 check (min_version_code > 0),
 apk_url text not null check (apk_url like 'https://%'),
 message text not null default 'A new update is available.',
 force_update boolean not null default false,
 published boolean not null default false,
 created_at timestamptz not null default now(),
 check (min_version_code <= version_code)
);
create index if not exists app_updates_latest_idx on public.app_updates(app_id,published,version_code desc);
alter table public.app_updates enable row level security;
drop policy if exists "Public can read published updates" on public.app_updates;
create policy "Public can read published updates" on public.app_updates for select to anon, authenticated using (published = true);
drop policy if exists "Admin can insert updates" on public.app_updates;
create policy "Admin can insert updates" on public.app_updates for insert to authenticated with check ((auth.jwt() ->> 'email') = 'admin@example.com');
drop policy if exists "Admin can update update records" on public.app_updates;
create policy "Admin can update update records" on public.app_updates for update to authenticated using ((auth.jwt() ->> 'email') = 'admin@example.com') with check ((auth.jwt() ->> 'email') = 'admin@example.com');
drop policy if exists "Admin can delete update records" on public.app_updates;
create policy "Admin can delete update records" on public.app_updates for delete to authenticated using ((auth.jwt() ->> 'email') = 'admin@example.com');

-- Before running: replace admin@example.com above with the exact admin email.
-- In Supabase Authentication, create that admin user and disable public sign-ups.
-- Never put a service_role key in the website.
