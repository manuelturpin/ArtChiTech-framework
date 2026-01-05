"""
Tests Load - Basic load testing
"""
import requests
import time
import concurrent.futures
import statistics

BASE_URL = "http://localhost:3001"

def make_request(endpoint):
    """Make a single request and return response time"""
    start = time.time()
    try:
        resp = requests.get(f"{BASE_URL}{endpoint}", timeout=10)
        elapsed = (time.time() - start) * 1000  # ms
        return {"status": resp.status_code, "time": elapsed, "success": resp.status_code == 200}
    except Exception as e:
        return {"status": 0, "time": 0, "success": False, "error": str(e)}


def load_test(endpoint, num_requests, concurrent_users):
    """Run load test on an endpoint"""
    print(f"\n📊 Testing {endpoint}")
    print(f"   Requests: {num_requests}, Concurrent: {concurrent_users}")

    results = []

    with concurrent.futures.ThreadPoolExecutor(max_workers=concurrent_users) as executor:
        futures = [executor.submit(make_request, endpoint) for _ in range(num_requests)]
        for future in concurrent.futures.as_completed(futures):
            results.append(future.result())

    # Calculate metrics
    times = [r['time'] for r in results if r['success']]
    success_count = sum(1 for r in results if r['success'])

    if times:
        avg_time = statistics.mean(times)
        p95_time = sorted(times)[int(len(times) * 0.95)] if len(times) > 1 else times[0]
        max_time = max(times)
        min_time = min(times)
    else:
        avg_time = p95_time = max_time = min_time = 0

    print(f"   Success: {success_count}/{num_requests} ({100*success_count/num_requests:.1f}%)")
    print(f"   Avg: {avg_time:.1f}ms | P95: {p95_time:.1f}ms | Max: {max_time:.1f}ms")

    return {
        "endpoint": endpoint,
        "success_rate": success_count / num_requests,
        "avg_time": avg_time,
        "p95_time": p95_time,
        "max_time": max_time,
    }


def run_load_tests():
    print("\n" + "="*50)
    print("⚡ Load Testing")
    print("="*50)

    endpoints = [
        "/api/bonsais",
        "/api/sites",
        "/api/stats",
    ]

    results = []
    for endpoint in endpoints:
        result = load_test(endpoint, num_requests=100, concurrent_users=10)
        results.append(result)

    # Summary
    print("\n" + "="*50)
    print("📈 Summary")
    print("="*50)

    all_passed = True
    target_p95 = 200  # ms

    for r in results:
        status = "✅" if r['p95_time'] < target_p95 else "⚠️"
        if r['p95_time'] >= target_p95:
            all_passed = False
        print(f"{status} {r['endpoint']}: P95={r['p95_time']:.1f}ms (target <{target_p95}ms)")

    print(f"\nOverall: {'✅ PASS' if all_passed else '⚠️ Some endpoints slow'}")
    print("="*50 + "\n")

    return all_passed


if __name__ == "__main__":
    import sys
    success = run_load_tests()
    sys.exit(0 if success else 1)
