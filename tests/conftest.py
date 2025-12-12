"""
Pytest configuration and shared fixtures for RATU Template tests.

This module provides common fixtures and configuration for all tests.
Add shared fixtures here to avoid duplication across test files.
"""

import pytest


@pytest.fixture
def sample_config():
    """Provide sample configuration for testing."""
    return {
        "app_name": "ratu-template-test",
        "debug": True,
    }
