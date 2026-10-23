# PropLedger — Prop Firm Expense Dashboard

A responsive web app for tracking prop-firm challenge/evaluation purchases, resets, subscriptions, platform/data costs, payout fees, refunds, payouts actually received, and account attempts across prop firms. Topstep and Lucid Trading are starting labels only; no fees, payouts, or other financial records are prefilled.

## Included features

- Dashboard KPIs: total expenses, payouts received, net cash result, and tracked accounts.
- Monthly cash flow, expense category breakdown, and firm-by-firm net cash result.
- Transaction ledger with search/filter and add/edit/delete.
- Account register for evaluations, funded accounts, failed attempts, passes, and closures.
- Separate trade-performance CSV import; trading P&L is not treated as a cash payout.
- JSON backup/restore.
- Browser-local storage by default; optional authenticated Supabase sync for cross-device persistence.
- GitHub Pages deployment workflow included at `.github/workflows/deploy.yml`.

## Deploy the website

1. Create a GitHub repository (for example, `propledger`) and upload the **contents** of this folder to its root.
2. Use the `main` branch.
3. In repository **Settings → Pages**, choose **GitHub Actions** as the deployment source.
4. Push to `main` or run the workflow from **Actions**. GitHub will show the published URL when deployment succeeds.

The app source is ready, but it has not been published to your GitHub account yet.

## Save data across devices

1. Create a project at https://supabase.com/.
2. In Supabase **SQL Editor**, run `supabase-schema.sql`.
3. Enable email magic-link authentication and add your published GitHub Pages URL to the allowed redirect URLs.
4. In PropLedger **Settings**, enter your Supabase project URL and public anon/publishable key, save, then sign in by email.
5. Confirm the app shows **Cloud synced**. Never put a Supabase service-role key in the browser.

Until cloud sync is configured, records are saved in that browser only. Use **Export backup** regularly. Cloud storage is one JSON record per signed-in user; simultaneous edits on multiple devices are not merged automatically.

## Important accounting separation

- Enter account purchases, resets, renewals, platform/data fees, and payout fees as expenses.
- Record a payout only when the money has actually arrived.
- Keep trading P&L separate from real fees and cash payouts.
- Amounts are stored as entered. The currency selector changes display formatting only; it does not convert values. Use one currency consistently for meaningful totals.
- Dashboard totals start at zero; no expenses or payouts have been invented.

## Run locally

Serve the folder over HTTP because the app loads the Supabase JavaScript client from a CDN:

```bash
python -m http.server 8000
```

Then open `http://localhost:8000`.
