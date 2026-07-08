# Customer Service Consultant Practice Scenarios

Static GitHub Pages app for Customer Service Consultant applicants to submit rich-text responses to three call scenarios.

Target live site: https://emersoncoaching.github.io/customer-service-practice-scenarios/

## Current Setup

- `config.js` points at the Supabase project for response storage.
- Run `supabase/schema.sql` in the Supabase SQL editor to create the Customer Service submission table and RPC functions.
- The three call recordings are included in `assets/audio/`.
- Applicants submit text responses with light rich text formatting.
- Dan reviews submissions from the private dashboard URL stored in `private/admin-dashboard.md`.
- Review pages can mark submissions accepted or rejected, and the dashboard groups open, accepted, and rejected submissions.
- Dan-facing dashboard and review pages require a one-time private-access password in each browser.
- New submissions can notify Dan through the `notify-customer-service-submission` Supabase Edge Function.

## Private Dashboard Setup

The dashboard uses an unguessable `?admin=` URL and a Supabase RPC function that compares the token to a SHA-256 hash.

To enable storage, the dashboard, and review-status actions in Supabase, run `supabase/schema.sql` in the Supabase SQL editor.

The real admin token is not committed to GitHub. Keep `private/admin-dashboard.md` local.

The private-access password itself is not committed; the public app stores only the SHA-256 hash used for the browser gate.
