# proyecto-avd-equipo-3
# ⚽ Análisis de Rendimiento Liga BetPlay 2025
### Bootcamp Análisis y Visualización de Datos — Talento Tech Valle
**Equipo 3** | Junio 2026

---

## 📋 Descripción del proyecto

Este proyecto analiza los datos históricos de la **Liga BetPlay 2025**
para identificar los factores estadísticos que más influyen en el
rendimiento de los equipos y construir un ranking de riesgo de descenso
basado en indicadores clave de desempeño.

> **Pregunta de negocio:**
> ¿Qué factores estadísticos (goles, partidos ganados/perdidos,
> diferencia de gol) influyen más en el rendimiento de los equipos
> de la Liga BetPlay, y cuáles tienen mayor riesgo de descenso?

---

## 🎯 Hallazgos principales

| # | Hallazgo | Valor |
|---|---|---|
| 1 | Factor con mayor correlación con puntos | Partidos ganados (0.98) |
| 2 | Factor de mayor riesgo | Partidos perdidos (-0.92) |
| 3 | Equipos en zona crítica | 4 equipos (índice > 0.75) |
| 4 | Equipo con mayor riesgo | Internacional de Bogotá (0.91) |
| 5 | Equipo líder | Independiente Medellín (40 pts) |

---

## 👥 Equipo

| Integrante | Rol |
|---|---|
| Anderson Ortega | Líder de proyecto |
| César Dinas | Ingeniero de datos |
| Arelys Parra Bohórquez | Analista de datos |
| Carlos Andrés Rivero | Diseñador de dashboard |
| Vivian Bright Tijaro | Comunicadora |

**Ejecutor:** Víctor A. Aguilar S. — Cymetria Group S.A.S.
**Mentor:** José Montaño

---

## 🗂️ Estructura del proyecto

```
Proyecto_AVD_Equipo_N3/
│
├── README.md
│
├── 01_Gestión/
│   ├── project_charter.pdf
│   ├── AVD_Equipo_N3 (Google Sheet)
│   └── google_sheet_link.txt
│
├── 02_datos/
│   ├── 01_Crudos/
│   │   └── betplay_2025_crudo.csv
│   └── 02_Procesados/
│       ├── betplay_2025_limpio.csv
│       └── betplay_2025_eda.csv
│
├── 03_codigo/
│   ├── 01_carga_y_limpieza.ipynb
│   ├── 02_eda.ipynb
│   └── 03_consultas.sql
│
├── 04_dashboard/
│   ├── dashboard_link.txt
│   └── capturas/
│       ├── grafico_distribucion.png
│       ├── grafico_correlaciones.png
│       ├── grafico_ranking_descenso.png
│       └── dashboard_completo.png
│
└── 05_entrega/
    ├── presentacion_final.pdf
    ├── recomendaciones.pdf
    ├── ranking_descenso.csv
    └── video_demo.txt
```

---

## 🛠️ Herramientas utilizadas

| Etapa | Herramienta |
|---|---|
| Gestión | Google Sheets |
| Datos crudos | Transfermarkt (datos reales) |
| Limpieza | Python — pandas |
| Análisis EDA | Python — pandas, matplotlib, seaborn |
| Consultas | SQL — SQLite Online |
| Dashboard | Looker Studio |
| Documentación | LaTeX — Overleaf |

---

## 📊 Dashboard interactivo

🔗 Ver dashboard en Looker Studio:
`[Pegar enlace del dashboard aquí]`

---

## 📁 Fuente de datos

| Dataset | Descripción | Fuente |
|---|---|---|
| `betplay_2025_crudo.csv` | Tabla de posiciones original | Transfermarkt |
| `betplay_2025_limpio.csv` | Datos limpios sin duplicados ni nulos | Procesado en Python |
| `betplay_2025_eda.csv` | Dataset enriquecido con índice de riesgo | Generado en EDA |
| `ranking_descenso.csv` | Ranking final de riesgo por equipo | Entregable final |

---

## 🔍 Metodología

```
Datos crudos (Transfermarkt)
        ↓
Python pandas — limpieza
(duplicados, nulos, tipos de datos)
        ↓
CSV procesado
        ↓
EDA — estadísticas descriptivas,
correlaciones, índice de riesgo
        ↓
SQL — consultas de análisis
        ↓
Dashboard Looker Studio
        ↓
Recomendaciones accionables
```

---

## ✅ Checklist de entrega

- [x] Carpeta con estructura propuesta
- [x] README.md con secciones básicas
- [x] Project Charter firmado por los cinco
- [x] Sheet con hoja de roles + bitácora
- [x] Datos crudos y procesados separados
- [x] Diccionario de datos completo
- [x] Notebooks con celdas de texto explicativas
- [x] Consultas SQL comentadas
- [x] Dashboard público con enlace
- [x] Capturas del dashboard en buena resolución
- [x] Recomendaciones accionables
- [ ] Video demo entre 3 y 5 minutos

---

*Bootcamp AVD — Talento Tech Valle | Cymetria Group S.A.S. | 2026*
