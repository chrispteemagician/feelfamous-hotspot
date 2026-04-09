# BUSINESS BEACON — Claude Code Build Prompt

**Project:** Business Beacon — offline business card portal for convention exhibitors and market stall holders
**Amazon affiliate tag:** tag=chrisptee-21
**Based on:** FeelFamous Basecamp tech (static HTML, offline-first, RavPower FileHub)

---

## THE PITCH

Visitors come to your booth, scan a QR code, connect to YOUR WiFi hotspot named after YOUR business, and get a beautiful offline page about you — no internet needed, no app, no data used.

The RavPower RP-WD03 FileHub (£30 on Amazon) is the hardware backbone. The visitor's phone does the rest.

---

## BUILD THIS

Create three files:

### 1. `beacon-creator.html`
A wizard that runs entirely in the browser (no server, no upload). Fields:
- Business name
- Your name
- What you do (one sentence — max 120 chars)
- Photo (optional — base64 encoded from file picker)
- Links: website URL, email, phone, up to 3 social handles (label + URL)
- Colour theme: choose from 5 presets (default: FeelFamous amber fire — `#0a0805` bg, `#c97e1a` accent, `#f0e8d5` text)

Output: a `Download your Beacon` button that generates a single self-contained HTML file named `[business-name-slug].html`. All images are base64 inline — no external dependencies.

The generated file must:
- Work completely offline
- Be mobile-first, 20px minimum body text
- Include their QR code (pre-filled with their website URL or a placeholder instruction)
- Have a FeelFamous credit in the footer (free tier) OR no credit (paid tier — toggle in wizard)
- Include the Amazon affiliate link to the RavPower RP-WD03 in a subtle "How this works" section

### 2. `beacon-template.html`
The output template used by beacon-creator.html. Amber fire aesthetic by default, overridden by chosen theme. Same structure as FeelFamous Basecamp pages: dark bg, serif headings, monospace labels.

Sections:
- Hero: business name + one-line pitch
- About: who you are, photo if provided
- Links: website, email, phone, socials (only shown if provided)
- QR code: generated via qrcode.js CDN but also inlined as fallback
- "How this works" box: brief explanation + RavPower Amazon link (affiliate)
- Footer: FeelFamous credit (free) or blank (paid)

### 3. `beacon-instructions.html`
Printable setup card. Tells the exhibitor:

1. Copy this file to a USB drive or SD card
2. Plug the drive into a **RavPower FileHub** — [link to Amazon, tag=chrisptee-21]
3. Name your WiFi after your business (in the FileHub settings at 10.10.10.254)
4. Print the QR code from your Beacon page and put it on your stall
5. Visitors scan → connect → see your page. Done.

Also include: "If you already have a phone hotspot, you can serve this file from any basic web server app."

---

## MONETISATION (build into wizard UI)

**Free tier:**
- FeelFamous credit in footer
- 5 colour themes
- Basic layout

**Paid (one-time £15) — toggle in wizard, honour system at launch:**
- Remove FeelFamous footer credit
- Add product/menu section (list of items with name, description, optional price)
- Priority in FeelFamous Business Beacon directory (future feature — placeholder text for now)

Stripe integration: NOT in this build. Just a note in the UI: "To unlock paid features, send £15 via ko-fi.com/zoom and reply with your order number. We'll send you an unlock code." Unlock code: simple localStorage check for a hardcoded string (this is honour-system launch, not security).

---

## TECHNICAL RULES

- Static HTML only — no server, no build step, no npm
- All external CDNs loaded from `<head>` (not inline script tags): QRCode.js, optionally Tailwind
- Fonts: Crimson Pro + Space Mono from Google Fonts (users will have internet when running the creator)
- Generated beacon file must be 100% self-contained (base64 images, inlined QR)
- Works in Chrome, Safari, Firefox — test on mobile viewport
- Save all 3 files to the same folder as the basecamp files

---

## CONTEXT

- This is part of the FeelFamous ecosystem: world domination through kindness, one ember at a time
- Primary use case: Spannabis Bilbao April 17-19 2026 and other cannabis/alternative festivals
- The RavPower hotspot is the distribution mechanism — every Beacon page is a node in the FeelFamous network
- Amazon affiliate links use tag=chrisptee-21 — include on every instruction card and in the "How this works" section
- Design language: dark `#0a0805`, amber `#c97e1a`, gold `#e8a830`, cream `#f0e8d5`, Crimson Pro + Space Mono
- Mobile first. 20px minimum body text. No reveal animations on first render (AuDHD-friendly)
