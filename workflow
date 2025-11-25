name: AI Tracking Automation

on:
  schedule:
    # 5:30 AM MST = 12:30 UTC
    - cron: "30 12 * * *"
    # 12:00 PM MST = 19:00 UTC
    - cron: "0 19 * * *"
    # 6:00 PM MST = 1:00 UTC (next day)
    - cron: "0 1 * * *"
  workflow_dispatch:

jobs:
  track:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: "3.10"

      - name: Install dependencies
        run: pip install requests beautifulsoup4

      - name: Run tracking script
        run: python tracking.py
