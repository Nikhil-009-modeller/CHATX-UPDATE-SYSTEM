# CHAT X Update System

Mobile-friendly GitHub Pages admin dashboard for publishing CHAT X update metadata through Supabase.

## Setup
1. Create a Supabase project.
2. Open Supabase **SQL Editor** and run `supabase-schema.sql` after replacing every `admin@example.com` with your admin email.
3. In Supabase Authentication, create the admin user and keep public sign-ups disabled.
4. Copy your Supabase Project URL and publishable/anon key. Never use a service-role key in the browser.
5. Upload `index.html` and `README.md` to a new GitHub repository named `CHATX-UPDATE-SYSTEM`.
6. In GitHub **Settings → Pages**, choose **Deploy from a branch**, select `main` and `/ (root)`, then save.
7. Open the GitHub Pages URL, enter the Supabase URL/key, save, sign in, and publish updates.

## Notes
- Supabase Auth + Row Level Security protects update publishing.
- The browser key is public by design; the RLS policies are essential.
- Use an HTTPS APK link.
- The dashboard currently creates new update records; it does not edit/delete existing rows.
- The website alone cannot make an installed app show a popup. CHAT X itself needs version-check code that compares its installed version code with the published record. The exact app-side code depends on whether CHAT X is native Android, a WebView wrapper, or a browser app.
