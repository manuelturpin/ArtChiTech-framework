"""
Tests Responsive - Mobile/Tablet/Desktop
"""
from playwright.sync_api import sync_playwright
import os

BASE_URL = "http://localhost:3001"
SCREENSHOTS_DIR = "/Users/manuelturpin/Desktop/bonsai974/claude/lab/lab-13-test-bonsai/docs/screenshots"

VIEWPORTS = [
    ("mobile", 375, 667),    # iPhone SE
    ("tablet", 768, 1024),   # iPad
    ("desktop", 1440, 900),  # Desktop
]

def test_responsive():
    os.makedirs(SCREENSHOTS_DIR, exist_ok=True)

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)

        for name, width, height in VIEWPORTS:
            context = browser.new_context(viewport={"width": width, "height": height})
            page = context.new_page()

            page.goto(BASE_URL)
            page.wait_for_load_state('networkidle')
            page.wait_for_selector('.bonsai-card')

            # Screenshot bonsais tab
            screenshot_path = f"{SCREENSHOTS_DIR}/responsive-{name}-bonsais.png"
            page.screenshot(path=screenshot_path, full_page=True)

            # Check cards are visible and properly sized
            cards = page.locator('.bonsai-card')
            assert cards.count() > 0, f"No cards on {name}"

            # Check stats bar (4 stats visible)
            stats = page.locator('.stat-card:visible')
            stats_count = stats.count()
            assert stats_count >= 4, f"Stats missing on {name}: got {stats_count}"

            # Click on Sites tab
            page.click('[data-tab="sites"]')
            page.wait_for_timeout(500)

            # Screenshot sites tab
            screenshot_path = f"{SCREENSHOTS_DIR}/responsive-{name}-sites.png"
            page.screenshot(path=screenshot_path, full_page=True)

            print(f"✓ {name} ({width}x{height}) - OK")
            context.close()

        browser.close()
        print(f"\n📸 Screenshots saved to {SCREENSHOTS_DIR}")
        return True

if __name__ == "__main__":
    test_responsive()
