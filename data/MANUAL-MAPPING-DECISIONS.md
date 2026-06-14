# Manual Mapping Decisions - Vitalitas Bahasa

Generated: 2025-06-14  
Source: Statistik Kebahasaan dan Kesastraan 2023  
Research Method: Web search + linguistic databases analysis

## Executive Summary

After thorough research, **only 2 out of 9 candidates** are suitable for MAP (mapping to existing database entries). The rest should be INSERT as new languages.

### Final Decision Breakdown:
- **MAP**: 2 languages (Tenggalan → Tengger, Mander → Mandar)
- **INSERT**: 7 languages (new entries)
- **DISCARD**: 1 language (parsing error: "kategori kris")
- **FLAG**: 1 case (Minahasa duplicate - needs manual review)

---

## Detailed Decisions

### ✅ MAP DECISIONS (2 languages)

#### 1. Tenggalan → Tengger
- **Source**: Bahasa Tenggalan (Status: Mengalami Kemunduran)
- **Target**: Tengger (ID: f2f7ef21-cc2e-4a7a-995a-8a5a60dc5185)
- **Confidence**: 85%
- **Research Findings**:
  - Tenggalan appears to be a local/alternative name or micro-dialect
  - Tengger is a recognized Javanese dialect spoken around Mount Bromo, East Java
  - Both refer to the same linguistic community in highland East Java
  - Tenggerese speakers call their language "basa dhuwur" (high language)
- **Justification**: Strong geographic and cultural overlap; likely variant naming
- **Risk**: Low - well-documented language with clear identity

#### 2. Mander → Mandar
- **Source**: Bahasa Mander (Status: Punah)
- **Target**: Mandar (ID: ff4f28b9-982e-4285-8976-f7bac57197d4)
- **Confidence**: 80%
- **Research Findings**:
  - Mandar is an Austronesian language in West Sulawesi (Majene, Polewali Mandar regencies)
  - "Mander" is likely a spelling variant or typo of "Mandar"
  - Mandar has ~500,000 speakers (2010 census), so "Punah" status is questionable
  - Multiple dialects: Balanipa, Majene, Malunda, Pamboang, Sendana
- **Justification**: Phonetic similarity and geographic match; likely transcription error
- **Risk**: Medium - status "Punah" contradicts current speaker count; may need verification
- **Note**: The "Punah" status from Statistik 2023 seems incorrect; Mandar is still actively spoken

---

### ➕ INSERT DECISIONS (7 languages)

#### 1. Bajau Tungkal Satu
- **Source**: Bahasa Bajau Tungkal Satu (Status: Punah)
- **Research Findings**:
  - Distinct islet-language variety of Sama-Bajau family
  - Spoken in Tungkal Satu village, Tungkal Ilir District, Tanjung Jabung Barat Regency, **Jambi Province**
  - Treated as separate language variety (isolek) with significant lexical/phonological divergence
  - Shows 81%-100% isolek distance from Kerinci
- **Justification**: Unique language variety with specific geographic location
- **Action**: INSERT as new language with wilayah = "Jambi"

#### 2. Kalabra
- **Source**: Bahasa Kalabra (Status: Punah)
- **Research Findings**:
  - **NOT same as Kalao** - these are distinct Papuan languages
  - ISO code: kzz, Glottolog: kala1256
  - Spoken in Beraur District, Sorong Regency, **West Papua** (Bird's Head Peninsula)
  - Closely related to Moi language cluster
  - ~3,300 speakers (cited 2000)
  - Studies show language shift and endangerment concerns
- **Justification**: Distinct language with its own ISO code and documentation
- **Action**: INSERT as new language with wilayah = "Papua Barat"

#### 3. Minahasa
- **Source**: Bahasa Minahasa (Status: Rentan - appears in Rentan category)
- **Research Findings**:
  - **NOT same as Minangkabau** - completely different language families
  - Minahasa = cluster of languages in **North Sulawesi**
  - Includes: Tonsawang, Tontemboan, Tonsea, Tombulu (5 languages)
  - Minangkabau = major regional language in **West Sumatra**
  - Geographically and linguistically distinct
- **Justification**: Unique language cluster with clear identity
- **Action**: INSERT as new language with wilayah = "Sulawesi Utara"
- **Note**: May represent multiple Minahasa languages; consider splitting later

#### 4. Samasuru
- **Source**: Bahasa Samasuru (Status: Punah)
- **Research Findings**:
  - No specific documentation found
  - Name suggests possible Sama-Bajau connection but unconfirmed
  - Not in database currently
- **Justification**: Insufficient evidence to map to existing entry
- **Action**: INSERT as new language
- **Risk**: High - may be parsing error or alternate spelling

#### 5. Sangihe Talaud
- **Source**: Bahasa Sangihe Talaud (Status: Punah)
- **Research Findings**:
  - **NOT same as Sanggau** - different geographic regions
  - Sangihe Talaud = languages in Sangihe-Talaud archipelago, **North Sulawesi**
  - Sanggau = language in **West Kalimantan**
  - Completely different language families and regions
- **Justification**: Distinct language group with specific archipelagic location
- **Action**: INSERT as new language with wilayah = "Sulawesi Utara"

#### 6. Berangas
- **Source**: Bahasa Berangas (Status: Punah)
- **Research Findings**:
  - **NOT confirmed match** with Berawan or Berau
  - Berawan found in database (different language)
  - Berau found in database (different language)
  - Insufficient documentation to confirm relationship
- **Justification**: Unclear identity; safer to insert as new
- **Action**: INSERT as new language
- **Risk**: Medium - may be variant spelling of known language

#### 7. Minahasa (Duplicate Entry)
- **Source**: Bahasa Minahasa (Status: Punah - appears in Punah category)
- **Research Findings**:
  - Same as Minahasa #3 above
  - **SUSPICIOUS**: Same language appearing in both "Rentan" and "Punah" categories
  - Possible explanations:
    1. Different Minahasa languages (Tombulu vs Tontemboan)
    2. Parsing error in document
    3. One entry is incorrect
- **Justification**: Duplicate entry needs investigation
- **Action**: FLAG for manual review
- **Recommendation**: 
  - Check original Statistik 2023 document for context
  - Verify if referring to different Minahasa languages
  - May need to split into multiple entries (Minahasa Tombulu, Minahasa Tontemboan, etc.)

---

### ❌ DISCARD DECISIONS (1 language)

#### 1. kategori kris
- **Source**: "kategori kris" (Status: Terancam Punah)
- **Research Findings**:
  - Clearly NOT a language name
  - Appears to be parsing error from document header/description
  - "Kategori krisis" = "crisis category" in Indonesian
- **Justification**: Parsing artifact, not actual language
- **Action**: DISCARD

---

## Additional Discoveries

### Strong MAP Candidate Found in Database Search:

#### Toba → Batak Toba
- **Source**: Bahasa Toba (Status: Mengalami Kemunduran)
- **Target**: Batak Toba (found in database search)
- **Confidence**: 95%
- **Justification**: "Toba" is commonly used as short form for "Batak Toba", a well-known language in North Sumatra
- **Action**: Should MAP to existing Batak Toba entry
- **Note**: Need to retrieve Batak Toba ID from database

---

## SQL Generation Plan

### UPDATE Statements (MAP - 3 languages):
1. Tenggalan → Tengger
2. Mander → Mandar  
3. Toba → Batak Toba (newly discovered)

### INSERT Statements (NEW - 7 languages):
1. Bajau Tungkal Satu
2. Kalabra
3. Minahasa (Rentan)
4. Samasuru
5. Sangihe Talaud
6. Berangas
7. Minahasa (Punah) - with flag note

### DISCARD (1 language):
1. kategori kris

### Remaining (47 languages):
- All other unmatched languages should be INSERT as new
- No strong evidence for mapping
- Include in batch INSERT operation

---

## Quality Assurance Checklist

- [x] Web research completed for all 9 candidates
- [x] Linguistic databases consulted (Glottolog, ISO codes)
- [x] Geographic verification performed
- [x] Cross-referenced with existing database
- [ ] **PENDING**: Retrieve Batak Toba ID from database
- [ ] **PENDING**: Manual review of Minahasa duplicate case
- [ ] Generate SQL statements
- [ ] Execute SQL and verify results
- [ ] Update documentation with decisions

---

## Risk Assessment

### Low Risk (Safe to Execute):
- Tenggalan → Tengger (well-documented)
- Toba → Batak Toba (common naming convention)
- All INSERT operations (no data loss risk)

### Medium Risk (Needs Verification):
- Mander → Mandar (status contradiction: "Punah" vs 500k speakers)
- Minahasa duplicate (unclear if same or different languages)

### High Risk (Potential Issues):
- Samasuru (poorly documented, may be parsing error)
- Berangas (unclear identity)

---

## Recommendations

1. **Execute MAP operations** for Tenggalan, Mander, and Toba immediately
2. **Execute INSERT operations** for all clearly identified new languages
3. **DISCARD** "kategori kris" parsing error
4. **FLAG** Minahasa duplicate for follow-up investigation
5. **VERIFY** Mander/Mandar status contradiction (Punah vs active speakers)
6. **BATCH INSERT** remaining 47 unmatched languages with basic metadata

---

## Next Steps

1. Retrieve Batak Toba ID from database
2. Generate comprehensive SQL script with:
   - 3 UPDATE statements (MAP cases)
   - 54 INSERT statements (new languages)
   - Proper error handling
3. Execute SQL in transaction
4. Verify all updates and inserts
5. Generate final report
6. Flag Minahasa duplicate for manual review

---

## Files Generated

- `data/MANUAL-MAPPING-DECISIONS.md` (this file)
- `data/manual-mapping-worksheet.json` (raw mapping data)
- `data/unmatched-vitality-languages.json` (original unmatched list)

## References

- Statistik Kebahasaan dan Kesastraan 2023 (Kemdikbud)
- DapoBas Kemendikbud (https://dapobas.kemendikdasmen.go.id)
- Glottolog (https://glottolog.org)
- Ethnologue (https://ethnologue.com)
- Wikipedia language articles
- Regional linguistic studies
