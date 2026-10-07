# Infraestructura Pública CL

Plataforma de datos que captura cada mes la cartera de inversión pública del BIP (que la fuente sobrescribe) y construye su historial, expresado en moneda constante con datos del Banco Central.

## Pregunta del producto

¿Cómo evoluciona la cartera de inversión pública por región y comuna en cuanto a monto, etapa y estado, de un corte temporal a otro, en moneda constante?

## Estado

- [ ] H0. Fundaciones. (en progreso)
- [ ] H1. Ingesta robusta
- [ ] H2. Modelado y transformación
- [ ] H3. Calidad y CI
- [ ] H4. Orquestación y operación
- [ ] H5. Cloud (GCP)
- [ ] H6. Data geoespacial
- [ ] H7. Dashboard público
- [ ] H8. Escalado y nicho

## Fuentes de datos
BIP vía BIDAT.
API BDE del Banco Central de Chile. API del Banco Central requiere credenciales propias, que irán en un .env que no se versiona;
Los datos no están en el repo: se generan con el pipeline.

## Cómo correrlo
```bash
git clone https://github.com/RafaelGodoy98/infraestructura-publica-cl.git
cd infraestructura-publica-cl
make setup   # instala dependencias exactas (uv.lock) y activa pre-commit
make test    # corre los tests
make lint    # verifica estilo y errores, sin modificar archivos
make format  # corrige formato automáticamente
```

### Requisitos
Linux o WSL2, uv, make

### Instalación y pruebas
- `make setup` instala el venv y setup
- `make test` corre pytest
- `make lint` aplica chequeos de ruff
- `make format` aplica format ruff
