"""
Tests for the config module.

These tests verify configuration values and settings.
"""

from ratu_template import config


def test_app_name_defined():
    """Test that APP_NAME is defined."""
    assert hasattr(config, "APP_NAME")
    assert config.APP_NAME == "ratu-template"


def test_version_defined():
    """Test that VERSION is defined."""
    assert hasattr(config, "VERSION")
    assert config.VERSION == "0.1.0"


def test_log_level_defined():
    """Test that LOG_LEVEL is defined."""
    assert hasattr(config, "LOG_LEVEL")
    assert config.LOG_LEVEL in ["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"]
