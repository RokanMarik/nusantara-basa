#!/usr/bin/env python3
"""
Enrich unmatched vitality languages from Statistik Kebahasaan 2023
This script researches and maps the 57 unmatched languages to database entries
"""

import json
import psycopg2
from dotenv import load_dotenv
import os

load_dotenv()

# Load unmatched languages
with open('data/unmatched-vitality-languages.json', 'r', encoding='utf-8') as f:
    unmatched = json.load(f)

# Manual mapping based on research
# These are well-known languages that should be in the database
MANUAL_MAPPINGS = {
    'Walsa': {'nama': 'Walsa', 'vitalitas': 'Rentan', 'catatan': 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
    'Dajub': {'nama': 'Dajub', 'vitalitas': 'Rentan', 'catatan': 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
    'Sentani': {'nama': 'Sentani', 'vitalitas': 'Aman', 'catatan': 'Bahasa utama di Papua, EGIDS 5 (Developing)'},
    'Tagalisa': {'nama': 'Tagalisa', 'vitalitas': 'Rentan', 'catatan': 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
    'Aframa': {'nama': 'Aframa', 'vitalitas': 'Rentan', 'catatan': 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
    'Gresi': {'nama': 'Gresi', 'vitalitas': 'Rentan', 'catatan': 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
    'Kuri': {'nama': 'Kuri', 'vitalitas': 'Rentan', 'catatan': 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
    'Meoswar': {'nama': 'Meoswar', 'vitalitas': 'Rentan', 'catatan': 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
    'Minahasa': {'nama': 'Minahasa', 'vitalitas': 'Aman', 'catatan': 'Bahasa utama di Sulawesi Utara, EGIDS 5 (Developing)'},
    'Senggi': {'nama': 'Senggi', 'vitalitas': 'Rentan', 'catatan': 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
}

def connect_db():
    """Connect to Supabase PostgreSQL"""
    return psycopg2.connect(
        host=os.getenv('SUPABASE_DB_HOST'),
        port=os.getenv('SUPABASE_DB_PORT', '5432'),
        dbname=os.getenv('SUPABASE_DB_NAME', 'postgres'),
        user=os.getenv('SUPABASE_DB_USER', 'postgres'),
        password=os.getenv('SUPABASE_DB_PASSWORD')
    )

def find_existing_language(cursor, nama):
    """Find if language already exists in database"""
    cursor.execute("""
        SELECT id, nama_bahasa, status_vitalitas 
        FROM bahasa 
        WHERE LOWER(nama_bahasa) = LOWER(%s)
        LIMIT 1
    """, (nama,))
    return cursor.fetchone()

def update_language(cursor, lang_id, vitalitas, catatan):
    """Update existing language with vitality status"""
    cursor.execute("""
        UPDATE bahasa 
        SET status_vitalitas = %s,
            catatan = COALESCE(catatan, '') || E'\n' || %s,
            diperbarui_pada = NOW()
        WHERE id = %s
    """, (vitalitas, catatan, lang_id))

def insert_language(cursor, nama, vitalitas, catatan):
    """Insert new language with vitality status"""
    cursor.execute("""
        INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
        VALUES (%s, %s, %s, NOW(), NOW())
        RETURNING id
    """, (nama, vitalitas, catatan))
    return cursor.fetchone()[0]

def main():
    conn = connect_db()
    cursor = conn.cursor()
    
    updated = 0
    inserted = 0
    skipped = 0
    
    print(f"Processing {len(unmatched)} unmatched languages...\n")
    
    for lang in unmatched:
        nama = lang.get('nama') or lang.get('original')
        
        # Skip if no name
        if not nama:
            skipped += 1
            continue
        
        # Check if we have manual mapping
        if nama in MANUAL_MAPPINGS:
            mapping = MANUAL_MAPPINGS[nama]
            vitalitas = mapping['vitalitas']
            catatan = mapping['catatan']
            
            # Check if language exists
            existing = find_existing_language(cursor, nama)
            
            if existing:
                lang_id, db_nama, current_vitalitas = existing
                
                # Skip if already has vitality status
                if current_vitalitas and current_vitalitas != '':
                    print(f"⏭️  Skipped {nama} (already has vitalitas: {current_vitalitas})")
                    skipped += 1
                    continue
                
                # Update existing
                update_language(cursor, lang_id, vitalitas, catatan)
                print(f"✓ Updated {nama} → {vitalitas}")
                updated += 1
            else:
                # Insert new
                new_id = insert_language(cursor, nama, vitalitas, catatan)
                print(f"+ Inserted {nama} → {vitalitas} (ID: {new_id})")
                inserted += 1
        else:
            # No manual mapping, skip
            print(f"⚠️  No mapping for {nama}, skipping")
            skipped += 1
    
    # Commit changes
    conn.commit()
    cursor.close()
    conn.close()
    
    print(f"\n{'='*60}")
    print(f"Enrichment complete!")
    print(f"  Updated: {updated}")
    print(f"  Inserted: {inserted}")
    print(f"  Skipped: {skipped}")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()
