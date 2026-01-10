# Research Report: Legal & Regulatory Framework

**Research Axis:** 08-legal
**Date:** January 2026
**Status:** Complete

---

## Executive Summary

This report provides a comprehensive analysis of the legal and regulatory requirements for launching an AI-powered pocket watch on the European and US markets. The regulatory landscape is complex and evolving, with significant new requirements coming into effect in 2025-2027, particularly around AI systems, cybersecurity, and radio equipment.

**Key Findings:**
- Total certification timeline: 6-18 months depending on complexity
- Estimated certification budget: EUR 15,000-50,000
- IP protection budget: EUR 10,000-30,000 (first year)
- GDPR compliance requires careful categorization of biometric/health data
- EU AI Act creates new obligations for AI-enabled devices (effective August 2027)

---

## Table of Contents

1. [LEG-001: Certifications Obligatoires](#leg-001-certifications-obligatoires)
2. [LEG-002: Propriete Intellectuelle](#leg-002-propriete-intellectuelle)
3. [LEG-003: RGPD et Donnees](#leg-003-rgpd-et-donnees)
4. [LEG-004: Reglementation Wearables](#leg-004-reglementation-wearables)
5. [LEG-005: Structure Juridique](#leg-005-structure-juridique)
6. [Budget & Timeline Summary](#budget--timeline-summary)
7. [Recommendations](#recommendations)

---

## LEG-001: Certifications Obligatoires

### Europe - CE Marking

#### Applicable Directives

| Directive | Scope | Requirement |
|-----------|-------|-------------|
| **Radio Equipment Directive (RED)** | WiFi, Bluetooth, LTE | Mandatory for all wireless devices |
| **EMC Directive 2014/30/EU** | Electromagnetic compatibility | Required for all electronics |
| **Low Voltage Directive 2014/35/EU** | Electrical safety | If voltage 50-1000V AC |
| **RoHS Directive 2011/65/EU** | Hazardous substances | Lead, mercury, cadmium limits |

#### NEW: Cybersecurity Requirements (August 2025)

Starting August 1, 2025, all wireless devices must comply with RED Articles 3.3 d/e/f:

- **Article 3.3(d):** Network protection against unauthorized access
- **Article 3.3(e):** Personal data and privacy protection
- **Article 3.3(f):** Fraud and misuse prevention

**Harmonized Standard:** EN 18031 (published in OJEU January 28, 2025)

#### CE Marking Process

1. Identify applicable directives and harmonized standards
2. Verify product-specific requirements
3. Determine if Notified Body involvement is required
4. Conduct conformity assessment
5. Prepare technical documentation
6. Affix CE marking and issue EU Declaration of Conformity

#### Costs (Europe)

| Item | Cost Range |
|------|------------|
| CE marking certification | EUR 700 - 4,800 |
| Technical documentation | EUR 120 - 1,200 |
| Consultancy fees | EUR 240 - 2,400 |
| Laboratory testing | EUR 240 - 13,500 |
| **Total estimate** | **EUR 1,300 - 21,900** |

#### Timeline

- Simple products: 2-3 months
- Complex wireless products: 4-6 months
- If Notified Body required: 6-12 months

> **Important:** Documentation must be retained for 10 years after last product placement on market.

**Sources:**
- [CE Marking Requirements - Your Europe](https://europa.eu/youreurope/business/product-requirements/labels-markings/ce-marking/index_en.htm)
- [RED Cybersecurity Deadline - Elite Electronic Engineering](https://www.elitetest.com/blog/ce-compliance/deadline-for-ce-mark-cyber-security/)
- [CE Certification for Wearables - JJR Lab](https://www.jjrlab.com/news/eu-certification-testing-for-smart-wearable-devices.html)

---

### USA - FCC Certification

#### Regulatory Framework

Wearable devices with wireless capabilities fall under **FCC Part 15**, covering:
- Bluetooth (intentional radiator)
- WiFi (intentional radiator)
- Other unlicensed RF transmissions

#### SAR Testing Requirements

**Critical for wearables:** Specific Absorption Rate testing is mandatory for devices worn on the body.

| Criterion | Requirement |
|-----------|-------------|
| Distance from body | < 20 cm (8 inches) |
| Power threshold | > 3 mW (new 2025 rules) |
| FCC SAR limit | 1.6 W/kg (averaged over 1g tissue) |

> **Note:** Previous Bluetooth exemption at 10 mW has been lowered to 3 mW. Most wearables now require SAR testing.

#### FCC Certification Process

1. Obtain FCC Registration Number (FRN) - free
2. Select accredited test laboratory
3. Conduct Part 15C testing (emissions, SAR if applicable)
4. Submit application through TCB (Telecommunications Certification Body)
5. Receive FCC ID grant

#### Costs (USA)

| Item | Cost Range |
|------|------------|
| FCC Part 15 testing | USD 900 - 2,000 |
| SAR testing (if required) | USD 2,000 - 5,000 |
| TCB filing fees | USD 1,000 - 2,000 |
| Attorney/consultant | USD 1,500 - 3,000 |
| **Total estimate** | **USD 5,400 - 12,000** |

For complex multi-radio devices (WiFi + Bluetooth + LTE): USD 8,000 - 20,000

#### Timeline

- Standard process: 4-8 weeks
- Expedited: 1-2 weeks (additional fees)

> **Important:** FCC certification is permanent and does not expire. However, antenna/enclosure changes may require re-testing.

**Sources:**
- [FCC Equipment Authorization](https://www.fcc.gov/oet/ea/rfdevice)
- [SAR Requirements for Wearables - RF Exposure Lab](https://rfexposurelab.com/sar-requirements-for-wearable-technology/)
- [FCC Certification Costs 2025 - H.B. Compliance](https://hbcompliance.com/how-much-does-fcc-certification-really-cost-a-breakdown-for-2025/)

---

### Other Markets

| Market | Certification | Requirements | Estimated Cost |
|--------|--------------|--------------|----------------|
| **Canada (ISED)** | IC certification | Similar to FCC Part 15 | CAD 3,000-8,000 |
| **UK (UKCA)** | Post-Brexit CE equivalent | Same directives as CE | GBP 2,000-10,000 |
| **Japan (MIC/TELEC)** | JATE/TELEC | Wireless certification | JPY 300,000-800,000 |
| **Australia (RCM)** | ACMA compliance | EMC + radio | AUD 3,000-8,000 |
| **China (SRRC/CCC)** | Mandatory | Radio + safety | CNY 30,000-100,000 |

---

### FDA Considerations (Health Claims)

#### Wellness vs. Medical Device Classification

The FDA revised its General Wellness Policy in January 2026, clarifying:

**General Wellness (Not FDA Regulated):**
- Devices promoting healthy habits
- Lifestyle factor management
- Non-invasive, low-risk technology
- NO claims to diagnose, treat, prevent, or cure disease

**Medical Device (FDA Regulated):**
- Claims clinical accuracy
- Provides diagnostic thresholds
- Guides clinical decision-making
- Measures values for medical purposes

#### Safe Wellness Claims

| Acceptable | NOT Acceptable |
|------------|----------------|
| "Track your heart rate during workouts" | "Detect arrhythmia" |
| "Monitor sleep patterns" | "Diagnose sleep apnea" |
| "Estimate blood pressure for wellness" | "Clinical-grade BP measurement" |
| "Nutritional glucose monitoring" | "Manage diabetes" |

> **Warning:** The FDA issued a warning letter to WHOOP in July 2025 for crossing the wellness/medical device line with blood pressure claims.

**Recommendation:** Position product as wellness device and carefully review all marketing claims with legal counsel.

**Sources:**
- [FDA General Wellness Policy](https://www.fda.gov/regulatory-information/search-fda-guidance-documents/general-wellness-policy-low-risk-devices)
- [FDA Wearables Guidance 2026](https://www.aha.org/news/headline/2026-01-06-fda-issues-guidance-wellness-products-clinical-decision-support-software)

---

## LEG-002: Propriete Intellectuelle

### Patent Strategy

#### Market Context

The wearable technology industry is experiencing a "patent gold rush":
- IoMT market: USD 34.93B (2023) -> USD 225.1B projected (2032)
- Companies aggressively filing for miniaturized sensors, AI algorithms, connectivity

#### Recommended Patent Categories

| Category | Examples | Priority |
|----------|----------|----------|
| **Mechanical/Design** | Pocket watch form factor, chain mechanism | High |
| **User Interface** | Unique interaction methods, haptic feedback | High |
| **AI Algorithms** | Predictive models, health algorithms | Critical |
| **Sensor Integration** | Novel sensor configurations | Medium |
| **Connectivity** | Unique wireless protocols | Low |

#### Filing Costs (2025)

**USA (USPTO):**

| Item | Small Entity | Large Entity |
|------|--------------|--------------|
| Utility patent filing | USD 350 | USD 800 |
| Examination fee | USD 480 | USD 1,440 |
| Issue fee | USD 500 | USD 1,200 |
| Attorney preparation | USD 5,000 - 15,000 | USD 8,000 - 20,000 |
| **Total (1 patent)** | **USD 6,330 - 16,330** | **USD 11,440 - 23,440** |

**Europe (EPO):**

| Item | Cost |
|------|------|
| Filing fee | EUR 135 |
| Search fee | EUR 1,350 |
| Examination fee | EUR 1,640 |
| Designation fees | EUR 650+ |
| Grant fee | EUR 1,000+ |
| Attorney fees | EUR 5,000 - 15,000 |
| **Total (1 patent)** | **EUR 8,775 - 19,775** |
| National validation (per country) | EUR 500 - 2,000/country |

**International (PCT):**

| Item | Cost |
|------|------|
| Filing fee | USD 1,456 |
| Handling fee | USD 219 |
| International search (EPO) | USD 2,154 |
| **Total PCT filing** | **USD 3,829** |

### Trademark Protection

#### Recommended Registrations

1. **Brand name** (word mark)
2. **Logo** (figurative mark)
3. **Product name** (if distinct)
4. **Tagline** (if used extensively)

#### Trademark Costs (2025)

**USA (USPTO):**
- Base filing: USD 350/class
- Attorney fees: USD 500 - 1,500
- Maintenance (Year 5-6): USD 325/class
- Renewal (10 years): USD 650/class

**Europe (EUIPO):**
- 1st class: EUR 850
- 2nd class: EUR 50
- Each additional: EUR 150
- Coverage: All 27 EU countries

**France (INPI):**
- 1-3 classes: EUR 210
- Each additional: EUR 42

### Design Registration

Protect the unique aesthetic of the pocket watch:

| Office | Cost | Duration |
|--------|------|----------|
| EUIPO | EUR 350 (1st design) | 25 years max |
| USPTO | USD 220 | 15 years |
| WIPO (Hague) | CHF 397 + per country | Varies |

### IP Budget Estimate (Year 1)

| Item | Low Estimate | High Estimate |
|------|--------------|---------------|
| 2 utility patents (EU + USA) | EUR 15,000 | EUR 45,000 |
| Trademarks (EU + USA) | EUR 2,500 | EUR 5,000 |
| Design registration | EUR 1,000 | EUR 3,000 |
| **Total Year 1** | **EUR 18,500** | **EUR 53,000** |

**Sources:**
- [USPTO Fee Schedule 2025](https://www.uspto.gov/learning-and-resources/fees-and-payment/uspto-fee-schedule)
- [Wearable Technology Patent Strategy - Henry Law](https://henry.law/blog/wearable-technology-patent-landscape/)
- [Smart Watch IP Rights - PatentPC](https://patentpc.com/blog/smart-watch-intellectual-property-rights)

---

## LEG-003: RGPD et Donnees

### Data Categories

#### Classification of PocketWatch AI Data

| Data Type | GDPR Category | Risk Level |
|-----------|---------------|------------|
| Heart rate | Health data (Art. 9) | High |
| Blood oxygen (SpO2) | Health data (Art. 9) | High |
| Sleep patterns | Health data (Art. 9) | High |
| Step count | Personal data | Medium |
| Location | Personal data | Medium |
| Voice recordings | Biometric data (Art. 9) | High |
| User preferences | Personal data | Low |
| Device identifiers | Personal data | Low |

> **Critical:** Health and biometric data are "special category data" under GDPR Article 9, requiring enhanced protection.

### Legal Basis for Processing

| Data Type | Recommended Legal Basis | Notes |
|-----------|------------------------|-------|
| Health metrics | Explicit consent (Art. 9.2.a) | Must be freely given, specific, informed |
| Basic personal data | Contract performance (Art. 6.1.b) | For service delivery |
| Analytics | Legitimate interest (Art. 6.1.f) | Requires balancing test |
| Marketing | Consent (Art. 6.1.a) | Opt-in required |

### Required GDPR Documentation

1. **Privacy Policy** - User-facing, plain language
2. **Data Processing Register (Art. 30)** - Internal record of all processing activities
3. **Data Protection Impact Assessment (DPIA)** - Mandatory for biometric data processing
4. **Consent Management System** - Granular consent recording
5. **Data Subject Rights Procedures** - Access, erasure, portability
6. **Breach Notification Procedure** - 72-hour notification requirement
7. **Processor Agreements (Art. 28)** - For all third-party data processors

### Security Measures (Art. 32)

| Measure | Requirement |
|---------|-------------|
| Encryption | AES-256 for data at rest, TLS 1.3 in transit |
| Pseudonymization | Separate identifiers from health data |
| Access control | Role-based, MFA for admin |
| Audit logging | All data access logged |
| Regular testing | Penetration testing, vulnerability scans |
| Incident response | Documented procedure |

### Data Retention

| Data Type | Retention Period | Basis |
|-----------|------------------|-------|
| Health data | Duration of account + 30 days | User request |
| Account data | Duration of account + 3 years | Legal requirement |
| Transaction data | 10 years | French commercial law |
| Analytics (anonymized) | Indefinite | No personal data |

### Compliance Cost Estimate

| Item | Cost |
|------|------|
| DPIA preparation | EUR 2,000 - 5,000 |
| Legal documentation | EUR 3,000 - 8,000 |
| Technical implementation | EUR 5,000 - 15,000 |
| DPO (if required) | EUR 1,500 - 3,000/month |
| Annual audit | EUR 2,000 - 5,000 |

**Sources:**
- [GDPR Biometric Data Compliance - GDPR Register](https://www.gdprregister.eu/gdpr/biometric-data-gdpr/)
- [Wearable Privacy Analysis - PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC12167361/)
- [Wearables in Clinical Trials - Crucial Data Solutions](https://www.crucialdatasolutions.com/blog/ensuring-wearables-compliance/)

---

## LEG-004: Reglementation Wearables

### EU AI Act Impact

#### Classification

AI systems in wearable devices are classified based on risk:

| Risk Level | Examples | Requirements |
|------------|----------|--------------|
| **Unacceptable** | Emotion inference in workplace | Prohibited |
| **High-risk** | Medical diagnosis, safety components | Full compliance |
| **Limited risk** | Chatbots, AI assistants | Transparency obligations |
| **Minimal risk** | Basic recommendations | No specific requirements |

#### Timeline

- **August 2024:** AI Act entered into force
- **February 2025:** Prohibited practices and AI literacy requirements apply
- **August 2025:** GPAI model obligations apply
- **August 2026:** General high-risk obligations apply
- **August 2027:** High-risk AI in regulated products (medical devices)

#### PocketWatch AI Implications

If the device includes AI for health predictions:
- Likely classified as **high-risk** if health monitoring with clinical implications
- May be **limited risk** if purely wellness-focused

**Recommendation:** Design AI features to remain in wellness category; avoid clinical claims.

### Radio Equipment Regulations

#### EU RED 2014/53/EU

| Standard | Purpose |
|----------|---------|
| ETSI EN 300 328 | WiFi 2.4 GHz |
| ETSI EN 301 489 | EMC for radio equipment |
| ETSI EN 303 645 | IoT cybersecurity |
| EN 18031-1:2024 | General security for internet-connected devices |
| EN 18031-2:2024 | Privacy and data protection |

#### Multi-Radio Coexistence

For devices with multiple radios (WiFi + Bluetooth + LTE):
- Must demonstrate internal transmitters operate without mutual interference
- Intra-device coexistence testing required
- Time-sharing algorithm validation

### Battery Regulations

#### UN 38.3 Requirements (2025 Updates)

All lithium batteries must pass 8 rigorous tests:

1. Altitude simulation
2. Thermal test
3. Vibration
4. Shock
5. External short circuit
6. Impact/crush
7. Overcharge
8. Forced discharge

**NEW for 2025:**
- Thermal abuse test (130C for 1 hour)
- External short circuit at 55C
- Overcharge protection (150% rated voltage)

#### Classification

| Battery Type | UN Number | Class |
|--------------|-----------|-------|
| Lithium-ion in device | UN 3481 | 9 (Dangerous goods) |
| Lithium metal in device | UN 3091 | 9 |

#### Shipping Requirements

- State of Charge: Maximum 30% during transport
- Labeling: UN number + Dangerous Goods warning
- Documentation: UN38.3 test report (ISO 17025 lab)
- Report validity: 2 years (retesting required for any design change)

#### Costs

| Item | Cost |
|------|------|
| UN 38.3 testing | EUR 3,000 - 8,000 |
| Certification timeline | 4-6 weeks |
| Documentation | EUR 500 - 1,500 |

### EU Battery Regulation (2023/1542)

New requirements phased in through 2027:
- Carbon footprint declaration (2025)
- Due diligence in supply chain (2025)
- Battery passport (2027)
- Recycled content requirements (2031)

### Upcoming Regulatory Changes

| Regulation | Effective Date | Impact |
|------------|---------------|--------|
| EU Cyber Resilience Act | 2027 | Software update requirements, vulnerability handling |
| EU AI Act (high-risk) | August 2027 | Conformity assessment for AI systems |
| EU Digital Product Passport | 2027+ | Product lifecycle information |
| EU Ecodesign for Sustainable Products | 2025+ | Repairability, recyclability requirements |

**Sources:**
- [EU AI Act - European Commission](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai)
- [Radio Equipment Directive - EU Commission](https://single-market-economy.ec.europa.eu/sectors/electrical-and-electronic-engineering-industries-eei/radio-equipment-directive-red_en)
- [UN 38.3 Shipping Guide - JJR Lab](https://www.jjrlab.com/news/un-383-lithium-battery-shipping-compliance-guide-2025.html)

---

## LEG-005: Structure Juridique

### Recommended Legal Structure: SAS

The **Societe par Actions Simplifiee (SAS)** is the optimal structure for a tech hardware startup in France.

#### Why SAS?

| Advantage | Description |
|-----------|-------------|
| Flexibility | Governance defined by shareholders in bylaws |
| Investor-friendly | Easy to issue different share classes, options |
| Limited liability | Shareholders liable only up to contribution |
| No minimum capital | EUR 1 legal minimum (EUR 4,000+ recommended) |
| Foreign ownership | 100% foreign ownership permitted |
| Scalability | Easy to add shareholders, raise capital |

#### SAS vs SARL Comparison

| Criterion | SAS | SARL |
|-----------|-----|------|
| Governance | Flexible (defined in bylaws) | Fixed by law |
| Share transfer | Free (unless restricted) | Approval required |
| President status | Assimile salarie | Gerant TNS |
| Investor appeal | High | Medium |
| Complexity | Medium | Low |

#### For Solo Founders: SASU

If starting alone, SASU (single-shareholder SAS) offers:
- Same benefits as SAS
- Easy conversion to multi-shareholder SAS
- Full limited liability protection

### Incorporation Process

1. **Choose company name** - Check availability at INPI
2. **Draft bylaws** (statuts) - With legal counsel
3. **Deposit share capital** - Bank account, minimum EUR 1 (recommend EUR 4,000+)
4. **Publish legal notice** - Authorized newspaper (EUR 150-250)
5. **Register with Greffe** - Commercial court registration
6. **Receive Kbis** - Certificate of incorporation (2 weeks)

#### Incorporation Costs

| Item | Cost |
|------|------|
| Bylaws drafting | EUR 500 - 2,000 |
| Publication | EUR 150 - 250 |
| Registration fees | EUR 40 - 60 |
| Bank account opening | EUR 0 - 100 |
| **Total** | **EUR 690 - 2,410** |

### Founder Agreements

Essential documents:

1. **Shareholders Agreement (Pacte d'Associes)**
   - Voting rights
   - Exit provisions (tag-along, drag-along)
   - Non-compete clauses
   - Decision-making thresholds

2. **IP Assignment Agreement**
   - Transfer of pre-existing IP to company
   - Invention assignment provisions

3. **Vesting Schedule**
   - 4-year vesting with 1-year cliff (standard)
   - Accelerated vesting triggers

4. **Board Composition**
   - Observer rights for investors
   - Reserved matters

### Governance Structure

| Role | Responsibility |
|------|----------------|
| President | Legal representative, day-to-day management |
| Director General | Optional, shares management powers |
| Board of Directors | Optional, strategic oversight |
| Shareholders Meeting | Major decisions, annual accounts approval |

### French Tech Advantages

- **La French Tech** - Government support for startups
- **Talent Passport Visa** - For foreign founders/employees
- **R&D Tax Credit (CIR)** - Up to 30% of R&D expenses
- **Young Innovative Company (JEI)** - Tax benefits for R&D startups

### Jurisdictional Alternatives

| Jurisdiction | Pros | Cons |
|--------------|------|------|
| **France (SAS)** | EU access, R&D credits, talent | Higher social charges |
| **Delaware (C-Corp)** | US investors, simple | No EU benefits, complex taxes |
| **UK (Ltd)** | Flexible, low taxes | Post-Brexit EU complications |
| **Estonia (OU)** | Digital, low cost | Limited physical presence |

**Recommendation:** Incorporate SAS in France for EU market access, R&D tax credits, and ease of hiring European talent. Consider US subsidiary later for US market expansion.

**Sources:**
- [SAS vs SARL Comparison - OpenAEuropeanCompany](https://www.openaeuropeancompany.com/blog/sas-vs-sarl-france/)
- [How to Create a SASU Startup - Escec International](https://escec-international.com/how-to-create-a-sasu-startup-in-france-a-practical-guide/)
- [France Business Registration - Multiplier](https://www.usemultiplier.com/france/company-registration)

---

## Budget & Timeline Summary

### Certification Budget

| Category | Minimum | Maximum |
|----------|---------|---------|
| CE Marking (Europe) | EUR 1,300 | EUR 21,900 |
| FCC Certification (USA) | EUR 5,000 | EUR 11,000 |
| Battery UN 38.3 | EUR 3,500 | EUR 9,500 |
| Other markets (2-3) | EUR 5,000 | EUR 25,000 |
| **Subtotal Certifications** | **EUR 14,800** | **EUR 67,400** |

### IP Budget (Year 1)

| Category | Minimum | Maximum |
|----------|---------|---------|
| Patents (2: EU + USA) | EUR 15,000 | EUR 45,000 |
| Trademarks (EU + USA) | EUR 2,500 | EUR 5,000 |
| Design registration | EUR 1,000 | EUR 3,000 |
| **Subtotal IP** | **EUR 18,500** | **EUR 53,000** |

### Compliance Budget

| Category | Minimum | Maximum |
|----------|---------|---------|
| GDPR implementation | EUR 10,000 | EUR 28,000 |
| Legal structure setup | EUR 1,000 | EUR 3,000 |
| Ongoing legal counsel | EUR 3,000 | EUR 10,000/year |
| **Subtotal Compliance** | **EUR 14,000** | **EUR 41,000** |

### Total First Year Legal Budget

| Scenario | Budget |
|----------|--------|
| **Minimum (EU only, basic IP)** | EUR 47,300 |
| **Recommended (EU + USA)** | EUR 85,000 |
| **Comprehensive (multi-market)** | EUR 161,400 |

### Timeline Overview

```
Month 1-2:   Company incorporation + IP filing
Month 2-4:   Product finalization + test sample preparation
Month 3-5:   CE pre-compliance testing
Month 4-6:   FCC testing + filing
Month 5-7:   CE final testing + documentation
Month 6-8:   Battery UN 38.3 certification
Month 7-9:   GDPR documentation finalization
Month 8-12:  CE marking obtention + market launch
```

**Critical Path:** 6-8 months minimum before market entry (assumes no Notified Body requirement)

---

## Recommendations

### Immediate Actions (0-3 months)

1. **Incorporate SAS** - Establish legal entity to hold IP
2. **File provisional patent** - Protect core innovations
3. **Register trademark** - Brand name in EU + USA
4. **Define data architecture** - Privacy by design
5. **Engage compliance consultant** - CE + FCC planning

### Pre-Launch Actions (3-6 months)

1. **Complete CE pre-testing** - Identify issues early
2. **Submit FCC application** - 4-8 week process
3. **Finalize GDPR documentation** - Privacy policy, consent flows
4. **Prepare wellness claims** - Legal review of all marketing
5. **UN 38.3 battery certification** - Required for shipping

### Market Entry Actions (6-12 months)

1. **Obtain CE marking** - EU market access
2. **Receive FCC grant** - USA market access
3. **Implement consent management** - GDPR operational compliance
4. **Establish customer support** - Data subject rights handling
5. **Monitor regulatory changes** - AI Act, CRA preparation

### Risk Mitigation

| Risk | Mitigation |
|------|------------|
| Medical device classification | Avoid clinical claims; wellness positioning only |
| Patent infringement | Prior art search before launch |
| GDPR breach | Data minimization; encryption; DPIA |
| Certification delays | Start testing 6+ months before launch |
| Tariff exposure | Consider EU manufacturing for EU market |

---

## Appendix: Key Regulatory Contacts

### Europe
- **EUIPO** (Trademarks): https://euipo.europa.eu
- **EPO** (Patents): https://www.epo.org
- **CE Marking Info**: https://europa.eu/youreurope/business/

### USA
- **USPTO**: https://www.uspto.gov
- **FCC**: https://www.fcc.gov
- **FDA**: https://www.fda.gov

### France
- **INPI** (IP): https://www.inpi.fr
- **CNIL** (Data protection): https://www.cnil.fr
- **ANFR** (Radio): https://www.anfr.fr

---

*Report generated: January 2026*
*Next review: Before Phase 4 (Development)*
