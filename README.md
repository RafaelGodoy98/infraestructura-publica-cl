# Infraestructura Pública CL

Plataforma de datos que captura cada mes la cartera de inversión pública del BIP (que la fuente sobrescribe) y construye su historial, expresado en moneda constante con datos del Banco Central.

## Pregunta del producto

¿Cómo evoluciona la cartera de inversión pública por región y comuna en cuanto a monto, etapa y estado, de un corte temporal a otro, en moneda constante?

## Estado

- [ ] H0 · Fundaciones (en progreso)
- [ ] H1 · Ingesta robusta
- [ ] H2 · Modelado y transformación
- [ ] H3 · Calidad y CI
- [ ] H4 · Orquestación y operación
- [ ] H5 · Cloud (GCP)
- [ ] H6 · Geoespacial
- [ ] H7 · Producto de datos público
- [ ] H8 · Escala y nicho

## Fuentes de datos

| Fuente | Qué aporta | Licencia / acceso |
|---|---|---|
| [Iniciativas de inversión BIP (BIDAT)](https://bidat.gob.cl/details/ficha/dataset/registro-de-proyectos-de-inversion), Ministerio de Desarrollo Social y Familia | Cartera de iniciativas de inversión pública, corte mensual | [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.es) |
| [API Base de Datos Estadísticos (BDE)](https://si3.bcentral.cl/estadisticas/Principal1/Web_Services/doc_es.htm), Banco Central de Chile | UF, dólar observado, PIB regional | Requiere registro y credenciales propias |

Los datos **no están en este repositorio**: se generan ejecutando el pipeline. Las credenciales de la API van en un archivo `.env` local, que no se versiona.

## Cómo correrlo

### Requisitos

- Linux o WSL2 (Windows)
- [uv](https://docs.astral.sh/uv/getting-started/installation/): `curl -LsSf https://astral.sh/uv/install.sh | sh`
- make: `sudo apt install make`
- - [Docker](https://docs.docker.com/get-docker/) (opcional, para `make docker-test`)

uv instala automáticamente la versión de Python requerida (3.13).

### Instalación y uso

```bash
git clone https://github.com/RafaelGodoy98/infraestructura-publica-cl.git
cd infraestructura-publica-cl
make setup   # instala dependencias exactas (uv.lock) y activa pre-commit
make test    # corre los tests
make lint    # verifica estilo y errores, sin modificar archivos
make format  # corrige formato automáticamente
make docker-test # construye la imagen y corre los tests en un contenedor aislado (requiere Docker)
```

## Estructura del repositorio

```
src/infraestructura_publica_cl/   código del pipeline
tests/                            tests automáticos (pytest)
Makefile                          comandos del proyecto
pyproject.toml / uv.lock          dependencias y configuración
```
