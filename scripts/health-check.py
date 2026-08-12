#!/usr/bin/env python3
"""Health Check Script for PlanetSTEAM Courses"""

import sys
import subprocess
from pathlib import Path
from datetime import datetime

def print_header(msg):
    print(f"\n{'='*60}\n  {msg}\n{'='*60}")

def check_dependencies():
    print_header("1. Checking Python Dependencies")
    dependencies = {
        "pandas": "data manipulation",
        "numpy": "numerical computing",
        "matplotlib": "plotting",
        "seaborn": "statistical visualization",
    }
    failed = []
    for lib, desc in dependencies.items():
        try:
            __import__(lib)
            print(f"  ✅ {lib:20} ({desc})")
        except ImportError:
            print(f"  ❌ {lib:20} ({desc})")
            failed.append(lib)
    return len(failed) == 0, failed

def check_quarto():
    print_header("2. Checking Quarto Installation")
    try:
        result = subprocess.run(["quarto", "--version"], capture_output=True, text=True, timeout=10)
        print(f"  ✅ Quarto version: {result.stdout.strip()}")
        return True
    except Exception as e:
        print(f"  ❌ Quarto not found: {e}")
        return False

def check_structure():
    print_header("3. Checking Directory Structure")
    required = ["01-python"]
    all_ok = True
    for d in required:
        if Path(d).exists():
            print(f"  ✅ {d}/ exists")
        else:
            print(f"  ❌ {d}/ NOT FOUND")
            all_ok = False
    return all_ok

def check_files():
    print_header("4. Checking Config Files")
    required = ["Dockerfile", "requirements.txt", "_metadata.json", "dashboard.html"]
    all_ok = True
    for f in required:
        if Path(f).exists():
            size = Path(f).stat().st_size
            print(f"  ✅ {f:35} ({size:,} bytes)")
        else:
            print(f"  ❌ {f:35} MISSING")
            all_ok = False
    return all_ok

def main():
    print(f"\n🏥 PlanetSTEAM Health Check — {datetime.now().isoformat()}")
    results = {
        "Dependencies": check_dependencies()[0],
        "Quarto": check_quarto(),
        "Directory Structure": check_structure(),
        "Configuration Files": check_files(),
    }
    print_header("SUMMARY")
    passed = sum(1 for v in results.values() if v)
    total = len(results)
    for check, status in results.items():
        symbol = "✅" if status else "❌"
        print(f"  {symbol} {check:30} {'PASS' if status else 'FAIL'}")
    print(f"\n  {passed}/{total} checks passed\n")
    return 0 if passed == total else 1

if __name__ == "__main__":
    sys.exit(main())
