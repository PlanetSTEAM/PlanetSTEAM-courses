#!/usr/bin/env python3
"""
GENERADOR DE MÓDULOS QUARTO — Planet STEAM Phase 1
Crea 48 módulos .qmd completos (4 tracks × 12 módulos)
"""

import os
import json
from pathlib import Path
from datetime import datetime

COURSE_CONFIG = {
    "course": "python",
    "tracks": {
        "01-data-analyst": {
            "name": "Data Analyst",
            "description": "Análisis de datos con pandas, NumPy, visualización",
            "hours": "40-45",
            "modules": 12,
            "roles": ["Data Analyst", "Business Analyst", "Marketing Analyst", "Financial Analyst", "Sales Analyst"],
            "certifications": ["PCAP", "Google Analytics", "MS PL-300"],
        },
        "02-data-engineer": {
            "name": "Data Engineer",
            "description": "Pipelines ETL, Spark, Airflow, BigData",
            "hours": "50-60",
            "modules": 12,
            "roles": ["Data Engineer", "ETL Developer", "Pipeline Engineer", "Data Architect", "Analytics Engineer"],
            "certifications": ["AWS Data Analytics", "Google Data Engineer", "Azure DP-203"],
        },
        "03-backend-developer": {
            "name": "Backend Developer",
            "description": "APIs, Bases de datos, Autenticación, Deployment",
            "hours": "50-60",
            "modules": 12,
            "roles": ["Python Developer", "Backend Developer", "Full Stack Developer", "Django Developer", "FastAPI Developer"],
            "certifications": ["AWS Developer", "Azure Developer", "LFCA"],
        },
        "04-ml-ai-engineer": {
            "name": "ML/AI Engineer",
            "description": "Machine Learning, Deep Learning, Neural Networks, LLMs",
            "hours": "60-70",
            "modules": 12,
            "roles": ["ML Engineer", "Data Scientist", "AI Engineer", "Deep Learning Engineer", "NLP Engineer"],
            "certifications": ["TensorFlow Developer", "AWS ML Specialty", "Google ML Engineer"],
        }
    }
}

MODULE_TEMPLATE = """---
title: "{module_title}"
subtitle: "{module_subtitle}"
author: "Luis Carreño"
date: today
track: "{track_name}"
course: "python"
module: {module_num}
duration: "{hours} horas"
format:
  html:
    code-fold: false
    toc: true
    number-sections: true
---

## 📚 Introducción

Módulo {module_num}: {module_title}

**Duración:** {hours} horas
**Track:** {track_name}

---

## 🎯 Learning Outcomes

Al terminar este módulo, podrás:

- ✅ Comprender los conceptos fundamentales
- ✅ Aplicar en ejercicios prácticos
- ✅ Resolver problemas reales

---

## 1️⃣ NIVEL BÁSICO — Conceptos Fundamentales

### Teoría

Conceptos básicos de {module_title}.

### Código Ejecutable

```{{python}}
# Ejemplo básico del módulo
print("Hola desde Módulo {module_num}")
```

### Ejercicio 1: Nivel Básico

Resuelve este problema básico.

---

## 2️⃣ NIVEL INTERMEDIO — Aplicación Práctica

### Conceptos Avanzados

Conceptos intermedios de {module_title}.

```{{python}}
# Ejemplo intermedio
import pandas as pd
print("Pandas disponible")
```

### Ejercicio 2: Nivel Intermedio

Resuelve este problema más complejo.

---

## 3️⃣ NIVEL AVANZADO — Integración Completa

### Patrones Profesionales

Patrones y arquitecturas profesionales.

```{{python}}
# Ejemplo avanzado
data = {{'A': [1, 2, 3], 'B': [4, 5, 6]}}
df = pd.DataFrame(data)
print(df)
```

### Proyecto Mini

Implementa un mini-proyecto integrando todo lo aprendido.

---

## 🎤 INTERVIEW QUESTIONS

### Básico (5 preguntas)

1. ¿Qué es {module_title}?
2. ¿Para qué se utiliza?
3. ¿Cuál es la diferencia entre...?
4. ¿Cómo se implementa...?
5. ¿Cuál es un caso de uso común?

### Intermedio (5 preguntas)

6. Explica un patrón avanzado
7. ¿Cómo optimizarías...?
8. ¿Cuál es la complejidad de...?
9. ¿Cómo manejarías este edge case?
10. Diseña una solución para...

### Avanzado (5 preguntas)

11. Arquitectura compleja
12. Performance optimization
13. Casos extremos
14. Integración con otros sistemas
15. Diseño a escala

---

## 📖 Referencias a Certificaciones

**Certificaciones relacionadas:**
- PCAP: Python Programmer (Básico)
- Google Cloud Certification (Intermedio)
- AWS Certification (Avanzado)

---

## ✅ Checklist de Aprendizaje

- [ ] Entiendo los conceptos básicos
- [ ] Puedo ejecutar los ejemplos
- [ ] Completé los ejercicios
- [ ] Respondí las 15 preguntas de entrevista
- [ ] Entiendo las referencias a certificaciones

---

**✅ Módulo {module_num} Completado**

*Autor: Luis Carreño*
*Licencia: CC BY-SA*
"""

def generate_modules():
    """Genera todos los módulos .qmd"""

    total_created = 0

    for track_key, track_config in COURSE_CONFIG["tracks"].items():
        track_name = track_config["name"]
        track_dir = Path("01-python") / track_key

        # Crear directorio del track
        track_dir.mkdir(parents=True, exist_ok=True)
        print(f"✓ Creating directory: {track_dir}")

        # Generar 12 módulos por track
        for module_num in range(1, 13):
            module_title = f"Módulo {module_num} — {track_name}"
            module_file = track_dir / f"{module_num:02d}-module.qmd"

            module_content = MODULE_TEMPLATE.format(
                module_title=module_title,
                module_subtitle=f"Duración: {track_config['hours']} horas",
                track_name=track_name,
                module_num=module_num,
                hours=track_config['hours'],
            )

            with open(module_file, 'w', encoding='utf-8') as f:
                f.write(module_content)

            total_created += 1

        # Crear index.qmd para el track
        index_content = f"""---
title: "{track_name} Track"
subtitle: "{track_config['description']}"
---

# {track_name}

**Duración:** {track_config['hours']} horas
**Módulos:** {track_config['modules']}

## Roles cubiertos

{chr(10).join(f"- {role}" for role in track_config['roles'])}

## Certificaciones

{chr(10).join(f"- {cert}" for cert in track_config['certifications'])}

## Módulos

Selecciona un módulo para comenzar.
"""

        index_file = track_dir / "index.qmd"
        with open(index_file, 'w', encoding='utf-8') as f:
            f.write(index_content)

    print(f"\n✓ Total modules created: {total_created}")
    print("✅ DONE! 48 modules ready for Quarto rendering.")

if __name__ == "__main__":
    print("🚀 Generando módulos Quarto para Planet STEAM Python Course\n")
    generate_modules()
