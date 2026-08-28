# ---------- Etage 1 : construction ----------
FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# ---------- Etage 2 : image finale ----------
FROM python:3.12-slim

WORKDIR /app

RUN useradd --create-home --uid 1001 appli

COPY --from=builder /install /usr/local

COPY app.py .

ENV PORT=8000

EXPOSE 8000

USER appli

CMD ["python", "app.py"]
