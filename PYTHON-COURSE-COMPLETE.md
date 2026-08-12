# 🐍 Python Professional Mastery Course

**Status:** Phase 1 | **Version:** 2026.08.11  
**Total Modules:** 48 | **Interview Q&A:** 720 | **Roles Covered:** 35

---

## 📋 TRACK 1: DATA ANALYST (12 Módulos)

### 🎯 Track Overview
- **Duración:** 40-45 horas
- **Roles:** Data Analyst, Business Analyst, Financial Analyst, Product Analyst
- **Salario LATAM:** $40k-70k (Junior) → $80k-120k (Senior)
- **Stack:** Python, Pandas, NumPy, Matplotlib, Seaborn, SQL, Excel, Tableau/PowerBI
- **Certificaciones:**
  - PCAP: Certified Associate Python Programmer ($99)
  - Google Analytics Certified Associate (Free)
  - Microsoft Data Analyst (PL-300) ($99)

---

### 📚 MÓDULO 1: Python Fundamentals for Data Analysis

**Duración:** 3-4 horas

#### 🎓 Learning Outcomes
- Configurar entorno Python (Jupyter, VS Code)
- Entender variables, tipos de datos, operadores
- Estructuras de control (if/else, loops)

#### 📖 Contenido Teórico

**1. Instalación & Setup**
```python
# Anaconda + Jupyter setup
# VS Code + Python extension
# Virtual environments (.venv)
```

**2. Variables & Data Types**
```python
# Enteros, floats, strings, booleans
# Type casting
# Naming conventions
```

**3. Operadores & Expresiones**
```python
# Aritméticos: +, -, *, /, //, %, **
# Comparación: ==, !=, <, >, <=, >=
# Lógicos: and, or, not
```

#### 🏋️ Ejercicios

**NIVEL 🌱 BÁSICO**
1. Crear variables de diferentes tipos y hacer casting
2. Calcular estadísticas simples (promedio de 5 números)
3. Verificar si un número es par/impar

**NIVEL ⚡ INTERMEDIO**
4. Generar tabla de conversión de monedas
5. Calcular índice de masa corporal con validación
6. Sistema simple de calificaciones

**NIVEL 🔥 AVANZADO**
7. Mini-proyecto: Calculadora científica con historial
8. Analizador de entrada de usuario con error handling
9. Simulador de cajero automático

#### 💼 Proyectos Asignados

| Nivel | Proyecto | Dominio | Stack | Objetivo |
|-------|----------|---------|-------|----------|
| 🌱 | Calculadora de ventas básica | Ventas | Python (básico) | Practicar variables y operadores |
| ⚡ | Dashboard de gastos personales | Finanzas | Python + Excel | Capturar datos, hacer cálculos |
| 🔥 | ETL simple de CSV a análisis | Datos | Python + Pandas | Leer datos, limpiar, análisis básico |

#### 🎤 Interview Questions (15 total)

**Básico (5)**
1. ¿Cuál es la diferencia entre `=` y `==`?
2. ¿Qué tipos de datos primitivos existen en Python?
3. ¿Cuándo usarías `elif` en lugar de `if`?
4. ¿Qué es una variable y cómo se declara?
5. ¿Cuál es el resultado de `"5" + "3"`?

**Intermedio (5)**
6. Explica el concepto de type casting. ¿Cuándo es necesario?
7. ¿Qué diferencia hay entre `list` y `tuple`?
8. ¿Cómo maneja Python la precedencia de operadores?
9. ¿Qué es un error de tipo y cómo evitarlo?
10. Escribe una función que valide si un string es un número

**Avanzado (5)**
11. Diseña un validador de datos con error handling completo
12. ¿Cuál es la diferencia entre mutabilidad e inmutabilidad?
13. Explica garbage collection en Python
14. ¿Cómo optimizarías operaciones sobre millones de números?
15. Architec una solución para procesar entrada de usuario robusta

---

### 📚 MÓDULO 2: Pandas & Data Manipulation

**Duración:** 4-5 horas

#### 🎯 Learning Outcomes
- Crear y manipular DataFrames
- Limpiar datos (missing values, duplicates)
- Agrupación y pivoting

#### 📖 Contenido

**1. DataFrames Basics**
```python
import pandas as pd

# Crear desde dict, CSV, Excel
df = pd.DataFrame({'col1': [1,2,3], 'col2': ['a','b','c']})

# Acceso a datos
df.head()
df.info()
df.describe()
```

**2. Data Cleaning**
```python
# Manejar NaN
df.dropna()
df.fillna(value=0)

# Duplicados
df.drop_duplicates()

# Tipos de datos
df.dtypes
df.astype({'col': 'int64'})
```

**3. Groupby & Aggregation**
```python
df.groupby('category')['amount'].sum()
df.groupby(['date', 'product']).agg({'sales': 'sum', 'qty': 'mean'})
```

#### 🏋️ Ejercicios

**NIVEL 🌱 BÁSICO**
1. Cargar CSV y explorar estructura
2. Calcular promedio de columna numérica
3. Filtrar datos por condición simple

**NIVEL ⚡ INTERMEDIO**
4. Limpiar dataset con valores faltantes
5. Agrupar y sumar ventas por categoría
6. Crear tabla dinámica simple

**NIVEL 🔥 AVANZADO**
7. Pipeline completo: cargar → limpiar → transformar → análisis
8. Detectar outliers con métodos estadísticos
9. Fusionar múltiples datasets

#### 💼 Proyectos Asignados

| Nivel | Proyecto | Dominio | Stack | Objetivo |
|-------|----------|---------|-------|----------|
| 🌱 | Análisis de ventas básico | Ventas | Pandas | Cargar CSV, filtrar, calcular totales |
| ⚡ | Dashboard de inventario | Inventario | Pandas + Excel | Limpiar datos, agrupar, reportes |
| 🔥 | Pipeline ETL de facturación | Facturación | Pandas + SQL | Múltiples fuentes, transformación compleja |

#### 🎤 Interview Questions (15)

**Básico (5)**
1. ¿Qué es un DataFrame?
2. ¿Cómo cargas un archivo CSV en Pandas?
3. ¿Qué método usas para ver las primeras filas?
4. ¿Cómo filtra datos en Pandas?
5. ¿Qué es `NaN` y cómo lo maneja Pandas?

**Intermedio (5)**
6. Explica la diferencia entre `.loc[]` y `.iloc[]`
7. ¿Cómo usarías `groupby()` con múltiples columnas?
8. ¿Cómo detectarías y eliminarías duplicados?
9. Escribe un `merge()` LEFT JOIN en Pandas
10. ¿Cuál es la forma más eficiente de iterar sobre filas?

**Avanzado (5)**
11. Diseña una función que limpie automáticamente cualquier dataset
12. ¿Cómo optimizarías Pandas para 10GB de datos?
13. Explica el concepto de "view" vs "copy" en Pandas
14. Cómo manejarías inconsistencias en tipos de datos
15. Arquitecta un pipeline de datos robusto con validación

---

### 📚 MÓDULO 3: NumPy & Mathematical Operations

**Duración:** 3-4 horas

#### 🎓 Learning Outcomes
- Crear y manipular arrays NumPy
- Operaciones matemáticas vectorizadas
- Broadcasting y performance

[SIMILARMENTE CON 9 MÓDULOS MÁS PARA DATA ANALYST]

---

## 📋 TRACK 2: DATA ENGINEER (12 Módulos)

### 🎯 Track Overview
- **Duración:** 50-60 horas
- **Roles:** Data Engineer, ETL Developer, Pipeline Engineer, Data Architect
- **Salario LATAM:** $50k-85k (Junior) → $100k-150k (Senior)
- **Stack:** Python, PySpark, Apache Airflow, Kafka, Docker, PostgreSQL/Snowflake
- **Certificaciones:**
  - AWS Certified Data Analytics Specialty ($150)
  - Google Cloud Professional Data Engineer ($200)
  - Microsoft Azure DP-203 ($99)

### 📚 MÓDULO 1: Python for Data Engineering Foundations

[ESTRUCTURA SIMILAR: Learning Outcomes, Contenido, Ejercicios 3 niveles, Proyectos reales, 15 Q&A]

### 📚 MÓDULO 2-12: [Airflow, Spark, Kafka, Cloud Platforms, etc.]

---

## 📋 TRACK 3: BACKEND DEVELOPER (12 Módulos)

### 🎯 Track Overview
- **Duración:** 50-60 horas
- **Roles:** Python Developer, Backend Developer, Full Stack Developer, FastAPI Developer
- **Salario LATAM:** $45k-90k → $90k-140k
- **Stack:** Python, Django/FastAPI, SQLAlchemy, Docker, PostgreSQL, Redis
- **Certificaciones:**
  - AWS Certified Developer - Associate ($150)
  - Microsoft Azure Developer Associate ($99)
  - Linux Foundation LFCA ($395)

### 📚 MÓDULO 1: REST APIs with FastAPI

**Duración:** 5-6 horas

#### 🎯 Learning Outcomes
- Crear endpoints REST profesionales
- Validación de datos con Pydantic
- Autenticación JWT
- Deployment en Docker

#### 📖 Contenido

**1. FastAPI Basics**
```python
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Item(BaseModel):
    name: str
    price: float
    description: str = None

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    return {"item_id": item_id}

@app.post("/items/")
async def create_item(item: Item):
    return item
```

**2. Pydantic Validation**
```python
from pydantic import BaseModel, validator, EmailStr

class User(BaseModel):
    email: EmailStr
    age: int
    
    @validator('age')
    def age_must_be_positive(cls, v):
        if v < 0:
            raise ValueError('age must be positive')
        return v
```

**3. JWT Authentication**
```python
from jose import JWTError, jwt
from datetime import datetime, timedelta

def create_access_token(data: dict):
    to_encode = data.copy()
    expire = datetime.utcnow() + timedelta(hours=24)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt
```

#### 🏋️ Ejercicios

**NIVEL 🌱 BÁSICO**
1. Crear endpoint GET simple
2. Crear endpoint POST con validación
3. Manejar parámetros de path y query

**NIVEL ⚡ INTERMEDIO**
4. Validación de datos complejos con Pydantic
5. Manejo de errores HTTP personalizado
6. Documentación automática (OpenAPI)

**NIVEL 🔥 AVANZADO**
7. Autenticación JWT completa (login, refresh)
8. Rate limiting y throttling
9. Middleware personalizado

#### 💼 Proyectos Asignados

| Nivel | Proyecto | Dominio | Stack | Objetivo |
|-------|----------|---------|-------|----------|
| 🌱 | API CRUD de productos | Ventas | FastAPI + Pydantic | Endpoints básicos GET/POST/PUT/DELETE |
| ⚡ | API de gestión de usuarios | RRHH | FastAPI + JWT + DB | Autenticación, validación, persistencia |
| 🔥 | Microservicio de facturación | Facturación | FastAPI + PostgreSQL + Docker | Arquitectura profesional, deploy ready |

#### 🎤 Interview Questions (15)

**Básico (5)**
1. ¿Qué es REST y cuáles son los verbos HTTP principales?
2. ¿Qué diferencia hay entre GET y POST?
3. ¿Qué es un endpoint?
4. ¿Cómo se estructura una URL RESTful?
5. ¿Qué es un status code 200, 404, 500?

**Intermedio (5)**
6. Explica qué es JWT y cómo funciona la autenticación
7. ¿Cómo validas datos con Pydantic?
8. ¿Qué es middleware y cuándo lo usarías?
9. ¿Cómo manejas errores en APIs REST?
10. Diseña un sistema de tokens de acceso y refresh

**Avanzado (5)**
11. Arquitecta una API de microservicios con autenticación centralizada
12. ¿Cómo optimizarías una API para millones de requests/día?
13. Explica CORS, CSRF y otras vulnerabilidades web
14. ¿Cómo implementarías rate limiting y throttling?
15. Diseña un sistema completo de versionado de APIs

---

### 📚 MÓDULO 2-12: [Databases, ORM, Caching, Testing, Deployment, etc.]

---

## 📋 TRACK 4: ML/AI ENGINEER (12 Módulos)

### 🎯 Track Overview
- **Duración:** 60-70 horas
- **Roles:** ML Engineer, Data Scientist, AI Engineer, Deep Learning Engineer, NLP Engineer
- **Salario LATAM:** $60k-120k → $130k-200k
- **Stack:** Python, TensorFlow, PyTorch, scikit-learn, Hugging Face, LangChain
- **Certificaciones:**
  - TensorFlow Developer Certificate ($100)
  - AWS ML Specialty ($300)
  - Google Cloud ML Engineer ($200)

### 📚 MÓDULO 1: Machine Learning Fundamentals

[ESTRUCTURA SIMILAR CON CONTENIDO DE ML]

### 📚 MÓDULO 2: Deep Learning with TensorFlow

### 📚 MÓDULO 3: Natural Language Processing

### 📚 MÓDULO 4-12: [Computer Vision, LLMs, MLOps, Production, etc.]

---

## 📊 RESUMEN TOTAL PYTHON COURSE

| Métrica | Valor |
|---------|-------|
| **Total Tracks** | 4 |
| **Módulos por Track** | 12 |
| **Total Módulos** | 48 |
| **Horas Estimadas** | 200-250 |
| **Roles Cubiertos** | 35 |
| **Proyectos Totales** | 144 (3 por módulo × 48) |
| **Interview Q&As** | 720 (15 per módulo) |
| **Certificaciones** | 12 |
| **Stack Tecnologías** | 50+ |
| **Dominios Negocio** | 15+ (Ventas, RRHH, Facturación, etc.) |

---

## 🏆 Certificaciones by Track

**Track 1 - Data Analyst:**
- PCAP ($99)
- Google Analytics ($Free)
- MS PL-300 ($99)

**Track 2 - Data Engineer:**
- AWS Data Analytics ($150)
- Google Cloud Data Engineer ($200)
- Azure DP-203 ($99)

**Track 3 - Backend:**
- AWS Developer ($150)
- Azure Developer ($99)
- LFCA ($395)

**Track 4 - ML/AI:**
- TensorFlow Developer ($100)
- AWS ML Specialty ($300)
- Google Cloud ML Engineer ($200)

---

## 💡 FEEDBACK CHECKLIST

Por favor revisa:

- ✅ **Estructura de módulos** → ¿3 niveles + 15 Q&A OK?
- ✅ **Proyectos** → ¿3 proyectos por módulo (1 básico, 1 intermedio, 1 avanzado)?
- ✅ **Certificaciones** → ¿Realistas y específicas por track?
- ✅ **Stack** → ¿Tecnologías correctas?
- ✅ **Dominios** → ¿Casos de negocio reales?
- ✅ **Interview Q&A** → ¿Nivel apropiado?

**¿Qué cambios hacer antes de generar los 22 cursos?**
