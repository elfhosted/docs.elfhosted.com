# ElfHosted Abuse Policy

**Effective Date:** 19 Dec 2025  
**Contact:** [abuse@elfhosted.com](mailto:abuse@elfhosted.com)

At **Elfhosted**, we provide infrastructure for users to host and deploy their own applications. We **do not provide, curate, or manage any content** accessible through these applications. All content is entirely **user-provided**, or obtained through **third-party APIs that scrape publicly available data**. As a result, Elfhosted disclaims all responsibility for the content or behavior of any user or application on the platform.

---

## 1. Content Responsibility

- **Elfhosted does not host or serve any original content.**  
  All media, metadata, links, or search results seen through hosted applications are either:
  - Provided by the user themselves, or
  - Fetched via APIs from public sources by the user’s configuration.

- **User-Controlled Deployments**: Each user is responsible for the applications they deploy and any resulting behavior or data output.

- **No Monitoring or Moderation**: Elfhosted does not monitor or moderate application content or activity.

---

## 2. Reporting Abuse

If you believe a user of our platform is engaging in illegal activity or violating acceptable use norms (e.g. malware, phishing, harassment, copyright infringement, etc.), please send a detailed report to:

📧 [abuse@elfhosted.com](mailto:abuse@elfhosted.com)

Your report should include:

- A clear description of the issue  
- The affected service URL or domain (if applicable)  
- Evidence or documentation of the abuse  
- Your contact details for follow-up (optional but encouraged)

---

## 3. Enforcement Actions

Upon receiving a valid abuse report:

- We will acknowledge and review the report (our goal is within 24 hours of receipt).
- If we determine a user is violating applicable laws, our Terms of Service, or causing harm via misuse of the platform, we may take **account-level action**.

❌ **We do not disable or intervene in individual applications.**  
✅ **We reserve the right to suspend or terminate user accounts** that are found to be in violation.

If remediation is required, we will specify a deadline (often between 12 and 48 hours depending on severity). Failure to respond or remediate in time may lead to immediate suspension without further notice.

---

## 4. Legal Requests

We comply with valid legal process, including subpoenas, warrants, and court orders.  
Please direct legal inquiries to [legal@elfhosted.com](mailto:legal@elfhosted.com).

For Digital Services Act (DSA) or Digital Millennium Copyright Act (DMCA) takedowns related to our Abavia-powered NNTP offering, please refer to the [Notice & Takedown policy](/legal/takedownnotice/) for the specific submission requirements.

---

## 5. API or Content Takedown Requests

If you believe a user-managed API, proxy, or feed made available through Elfhosted is publishing or indexing material that infringes your rights, please submit a formal notice to [legal@elfhosted.com](mailto:legal@elfhosted.com) with the subject line **“Elfhosted API takedown – Your Organization”**. To be actionable, include:

- The specific endpoint, URL, or host header in question and the last-seen timestamp (UTC preferred)
- A concise description of the allegedly infringing material and the rights you assert
- Evidence that you control or represent the rights holder (e.g., assignment letter, agency agreement, copyright registration number)
- A declaration that your notice is accurate and made under penalty of perjury, along with a typed signature and contact details

Complete notices receive a ticket ID within one business day. Incomplete or vague submissions may be deprioritized or returned for clarification. Please do not escalate to upstream infrastructure or payment vendors - Elfhosted can only act on requests submitted through this channel.

### Public Stremio add-ons

ElfHosted operates a small catalog of public Stremio add-ons that expose user-supplied sources (RealDebrid, AllDebrid, EasyNews, etc.) through Stremio’s API. These add-ons do not bundle media or Plex libraries; every user brings their own accounts and credentials, and liability for what they ingest rests entirely with that user.

Because the add-ons are publicly reachable and stateless, we cannot disable a single user or account. Our only remedy is to remove or null-route the specific entry that you identify. Your notice must therefore include verifiable identifiers such as:

- The add-on base URL plus the catalog/stream path being queried (e.g., `/catalog/movie/hd/info.json`)
- Magnet URIs or BitTorrent info-hashes returned by the add-on
- Usenet identifiers (message ID, NZB GUID) or direct HTTP links surfaced by the add-on

Once we can match the identifier to our cache, we block or purge that record so it no longer resolves for any Stremio user. Requests without concrete hashes, URLs, or message IDs cannot be actioned.

---

## 6. Abuse of the Reporting Process

False or malicious complaints undermine the reporting process. Submitting repeated or bad-faith reports may result in:

- Restrictions on your ability to submit further complaints  
- Referral to appropriate authorities

---

