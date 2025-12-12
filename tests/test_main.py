"""
Tests for the main module.

These tests verify the basic functionality of the main entry point.
"""

from ratu_template.main import main


def test_main_runs_without_error(capsys):
    """Test that main function executes without raising exceptions."""
    main()
    captured = capsys.readouterr()
    assert "RATU Template initialized successfully" in captured.out


def test_main_prints_customization_message(capsys):
    """Test that main function prints customization guidance."""
    main()
    captured = capsys.readouterr()
    assert "Customize this template" in captured.out
