from app import app


def test_sante_repond_ok():
    client = app.test_client()
    reponse = client.get("/sante")
    assert reponse.status_code == 200
    assert reponse.get_json()["statut"] == "ok"


def test_alertes_sans_base():
    client = app.test_client()
    reponse = client.get("/alertes")
    assert reponse.status_code == 200

    donnees = reponse.get_json()
    assert donnees["source"] == "memoire"

    noms = [station["nom"] for station in donnees["alertes"]]
    assert "Place du Marche" in noms
    assert "Universite" in noms
    assert all(
        station["velos_disponibles"] <= 2
        for station in donnees["alertes"]
    )
