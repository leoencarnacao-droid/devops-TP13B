from unittest.mock import MagicMock, patch

import pytest

import app


@pytest.fixture
def client():
    app.app.config["TESTING"] = True
    return app.app.test_client()


def fake_conn():
    conn = MagicMock()

    cur = (
        conn.__enter__.return_value.cursor
        .return_value.__enter__.return_value
    )

    cur.fetchall.return_value = []
    cur.fetchone.return_value = (1,)

    return conn


@patch("app.get_conn")
def test_health(conn, client):
    conn.return_value = fake_conn()

    assert client.get("/health").status_code == 200


@patch("app.get_conn")
def test_list(conn, client):
    conn.return_value = fake_conn()

    assert client.get("/api/notes").json == []


@patch("app.get_conn")
def test_create_and_delete(conn, client):
    conn.return_value = fake_conn()

    assert (
        client.post(
            "/api/notes",
            json={"title": "x"},
        ).status_code
        == 201
    )

    assert client.delete("/api/notes/1").status_code == 200


def test_create_rejects_missing_title(client):
    assert (
        client.post(
            "/api/notes",
            json={},
        ).status_code
        == 400
    )
