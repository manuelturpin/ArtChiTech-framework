"""
Tests E2E pour Bonsai Tracker MVP
Utilise Playwright pour tester l'interface web
"""
from playwright.sync_api import sync_playwright, expect
import sys
import re

BASE_URL = "http://localhost:3001"

def test_dashboard_loads():
    """Test que le dashboard charge avec les statistiques"""
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')

        # Vérifier le titre
        assert "Bonsai Tracker" in page.title()

        # Vérifier les stats cards
        stat_total = page.locator('#stat-total')
        expect(stat_total).to_be_visible()

        stat_sites = page.locator('#stat-sites')
        expect(stat_sites).to_be_visible()

        # Vérifier que le total n'est pas "-"
        total_text = stat_total.inner_text()
        assert total_text != "-", f"Stats not loaded: {total_text}"

        print("✓ Dashboard loads with statistics")
        browser.close()
        return True

def test_bonsai_grid_displays():
    """Test que la grille affiche les bonsais"""
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')

        # Attendre les cards
        page.wait_for_selector('.bonsai-card', timeout=5000)

        # Vérifier qu'il y a des cards
        cards = page.locator('.bonsai-card')
        count = cards.count()
        assert count > 0, "No bonsai cards displayed"

        print(f"✓ Bonsai grid displays {count} cards")
        browser.close()
        return True

def test_create_bonsai():
    """Test la création d'un nouveau bonsai"""
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')

        # Compter les bonsais avant
        page.wait_for_selector('.bonsai-card')
        initial_count = page.locator('.bonsai-card').count()

        # Cliquer sur "Nouveau Bonsai"
        page.click('#btn-new')

        # Vérifier que le modal s'ouvre
        modal = page.locator('#modal-form')
        expect(modal).to_have_class(re.compile("active"))

        # Remplir le formulaire
        page.fill('#form-species', 'Test Juniperus')
        page.fill('#form-age', '15')
        page.fill('#form-site', 'test-site')
        page.select_option('#form-status', 'healthy')

        # Soumettre
        page.click('button[type="submit"]')

        # Attendre la fermeture du modal (classe active retirée = display:none)
        page.wait_for_function("!document.querySelector('#modal-form').classList.contains('active')", timeout=5000)
        page.wait_for_timeout(500)  # Attendre le refresh

        # Vérifier qu'un bonsai a été ajouté
        new_count = page.locator('.bonsai-card').count()
        assert new_count == initial_count + 1, f"Expected {initial_count + 1} cards, got {new_count}"

        # Vérifier que le nouveau bonsai apparaît
        page.wait_for_selector('text=Test Juniperus', timeout=3000)

        print("✓ Create bonsai works")
        browser.close()
        return True

def test_filter_by_status():
    """Test le filtre par statut"""
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')
        page.wait_for_selector('.bonsai-card')

        # Compter tous les bonsais
        total_count = page.locator('.bonsai-card').count()

        # Filtrer par "healthy"
        page.select_option('#filter-status', 'healthy')
        page.wait_for_timeout(300)

        # Vérifier que le filtre fonctionne
        healthy_count = page.locator('.bonsai-card').count()

        # Tous les cards visibles doivent avoir le badge "En santé" (CSS uppercase)
        badges = page.locator('.bonsai-card .status-badge')
        for i in range(badges.count()):
            badge_text = badges.nth(i).inner_text().lower()
            assert badge_text == "en santé", f"Expected 'en santé', got '{badge_text}'"

        print(f"✓ Filter by status works ({healthy_count}/{total_count} healthy)")
        browser.close()
        return True

def test_search_by_species():
    """Test la recherche par espèce"""
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')
        page.wait_for_selector('.bonsai-card')

        # Rechercher "Ficus"
        page.fill('#filter-species', 'Ficus')
        page.wait_for_timeout(300)

        # Vérifier que seuls les Ficus sont affichés
        cards = page.locator('.bonsai-card')
        count = cards.count()

        if count > 0:
            # Vérifier que tous contiennent "Ficus"
            headers = page.locator('.bonsai-card .bonsai-header h3')
            for i in range(headers.count()):
                species = headers.nth(i).inner_text()
                assert 'ficus' in species.lower(), f"Expected 'Ficus' in '{species}'"
            print(f"✓ Search by species works ({count} Ficus found)")
        else:
            print("✓ Search by species works (no Ficus in data)")

        browser.close()
        return True

def test_edit_bonsai():
    """Test la modification d'un bonsai"""
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')
        page.wait_for_selector('.bonsai-card')

        # Cliquer sur Modifier du premier bonsai
        page.click('.bonsai-card:first-child button:has-text("Modifier")')

        # Vérifier que le modal s'ouvre avec les données
        modal = page.locator('#modal-form')
        expect(modal).to_have_class(re.compile("active"))

        # Vérifier que le champ espèce a une valeur
        species_value = page.input_value('#form-species')
        assert species_value != '', "Species should be pre-filled"

        # Modifier l'âge
        page.fill('#form-age', '99')

        # Soumettre
        page.click('button[type="submit"]')

        # Attendre la fermeture
        page.wait_for_function("!document.querySelector('#modal-form').classList.contains('active')", timeout=5000)

        print("✓ Edit bonsai works")
        browser.close()
        return True

def test_transfer_bonsai():
    """Test le transfert d'un bonsai"""
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')
        page.wait_for_selector('.bonsai-card')

        # Cliquer sur Transférer du premier bonsai
        page.click('.bonsai-card:first-child button:has-text("Transférer")')

        # Vérifier que le modal s'ouvre
        modal = page.locator('#modal-transfer')
        expect(modal).to_have_class(re.compile("active"))

        # Remplir le nouveau site
        page.fill('#transfer-site', 'new-test-site')

        # Soumettre
        page.click('#transfer-form button[type="submit"]')

        # Attendre la fermeture
        page.wait_for_function("!document.querySelector('#modal-transfer').classList.contains('active')", timeout=5000)

        print("✓ Transfer bonsai works")
        browser.close()
        return True

def test_delete_bonsai():
    """Test la suppression d'un bonsai"""
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        # Gérer le dialog de confirmation
        page.on('dialog', lambda dialog: dialog.accept())

        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')
        page.wait_for_selector('.bonsai-card')

        # Compter avant
        initial_count = page.locator('.bonsai-card').count()

        # Supprimer le premier bonsai
        page.click('.bonsai-card:first-child button:has-text("🗑️")')

        # Attendre le refresh
        page.wait_for_timeout(500)

        # Vérifier qu'un bonsai a été supprimé
        new_count = page.locator('.bonsai-card').count()
        assert new_count == initial_count - 1, f"Expected {initial_count - 1} cards, got {new_count}"

        print("✓ Delete bonsai works")
        browser.close()
        return True

def run_all_tests():
    """Exécute tous les tests"""
    tests = [
        ("Dashboard loads", test_dashboard_loads),
        ("Bonsai grid displays", test_bonsai_grid_displays),
        ("Create bonsai", test_create_bonsai),
        ("Filter by status", test_filter_by_status),
        ("Search by species", test_search_by_species),
        ("Edit bonsai", test_edit_bonsai),
        ("Transfer bonsai", test_transfer_bonsai),
        ("Delete bonsai", test_delete_bonsai),
    ]

    print("\n" + "="*50)
    print("🧪 Bonsai Tracker E2E Tests")
    print("="*50 + "\n")

    passed = 0
    failed = 0

    for name, test_fn in tests:
        try:
            test_fn()
            passed += 1
        except Exception as e:
            print(f"✗ {name} FAILED: {e}")
            failed += 1

    print("\n" + "="*50)
    print(f"Results: {passed} passed, {failed} failed")
    print("="*50 + "\n")

    return failed == 0

if __name__ == "__main__":
    success = run_all_tests()
    sys.exit(0 if success else 1)
