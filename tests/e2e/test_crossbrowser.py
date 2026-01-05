"""
Tests Cross-Browser - Chromium, Firefox, WebKit (Safari)
"""
from playwright.sync_api import sync_playwright

BASE_URL = "http://localhost:3001"

def test_browser(browser_type, browser_name):
    """Test basic functionality in a specific browser"""
    browser = browser_type.launch(headless=True)
    page = browser.new_page()

    try:
        # Load page
        page.goto(BASE_URL)
        page.wait_for_load_state('networkidle')

        # Check title
        assert "Bonsai Tracker" in page.title(), f"{browser_name}: Title mismatch"

        # Check bonsai cards load
        page.wait_for_selector('.bonsai-card', timeout=5000)
        cards = page.locator('.bonsai-card')
        assert cards.count() > 0, f"{browser_name}: No cards"

        # Check stats load
        stat_total = page.locator('#stat-total').inner_text()
        assert stat_total != "-", f"{browser_name}: Stats not loaded"

        # Test create modal opens
        page.click('#btn-new')
        modal = page.locator('#modal-form')
        assert modal.is_visible(), f"{browser_name}: Modal not visible"

        # Close modal
        page.click('#close-form')
        page.wait_for_timeout(300)

        # Test tab switching
        page.click('[data-tab="sites"]')
        page.wait_for_timeout(500)
        sites_tab = page.locator('#tab-sites')
        assert sites_tab.is_visible(), f"{browser_name}: Sites tab not visible"

        print(f"✓ {browser_name} - All tests passed")
        return True

    except Exception as e:
        print(f"✗ {browser_name} - FAILED: {e}")
        return False

    finally:
        browser.close()


def run_crossbrowser_tests():
    print("\n" + "="*50)
    print("🌐 Cross-Browser Testing")
    print("="*50 + "\n")

    results = {}

    with sync_playwright() as p:
        # Chromium
        results['Chromium'] = test_browser(p.chromium, 'Chromium')

        # Firefox
        results['Firefox'] = test_browser(p.firefox, 'Firefox')

        # WebKit (Safari)
        results['WebKit (Safari)'] = test_browser(p.webkit, 'WebKit (Safari)')

    print("\n" + "="*50)
    passed = sum(1 for v in results.values() if v)
    total = len(results)
    print(f"Results: {passed}/{total} browsers passed")
    print("="*50 + "\n")

    return all(results.values())


if __name__ == "__main__":
    import sys
    success = run_crossbrowser_tests()
    sys.exit(0 if success else 1)
