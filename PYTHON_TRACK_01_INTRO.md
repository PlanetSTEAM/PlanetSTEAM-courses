# Módulo 1: ¿Qué es Python? + Setup Profesional

**Duración:** 2 horas  
**Nivel:** 🌱 Principiante  
**Track:** Data Analyst  
**Status:** ✅ COMPLETO

---

## 🎯 Learning Outcomes

Al terminar este módulo, podrás:
- ✅ Entender qué es Python y por qué es ideal para análisis de datos
- ✅ Instalar Python 3.11+ en tu máquina
- ✅ Configurar VS Code como IDE profesional
- ✅ Instalar librerías esenciales (pandas, numpy, matplotlib)
- ✅ Escribir y ejecutar tu primer programa Python
- ✅ Entender la estructura de un proyecto profesional

---

## 📖 PARTE 1: ¿QUÉ ES PYTHON? (20 minutos)

### Python es un lenguaje de programación

Python es un **lenguaje de programación de alto nivel** creado en 1991 por Guido van Rossum. Se caracteriza por:

- **Legible:** código que parece pseudocódigo en inglés
- **Versátil:** web, data science, automatización, AI/ML
- **Popular:** segundo lenguaje más usado en mundo
- **Comunidad:** millones de desarrolladores, librerías infinitas

### ¿Por qué Python para Data Analysis?

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  1. Pandas: manipulación de datos más fácil del mundo  │
│  2. NumPy: cálculos matemáticos vectorizados           │
│  3. Matplotlib/Seaborn: visualizaciones profesionales  │
│  4. Scikit-learn: machine learning en 3 líneas         │
│  5. Jupyter: notebooks interactivos para análisis      │
│  6. Comunidad LATAM: tutoriales en español             │
│  7. Salarios: $50k-150k USD (vs Excel analyst $30k)   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Python vs otros lenguajes para Data

| Lenguaje | Data Analysis | Velocidad | Curva Aprendizaje |
|----------|---------------|-----------|-------------------|
| **Python** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ (fácil) |
| R | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| SQL | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Excel | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ (fácil) |
| Java | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |

**Conclusión:** Python = mejor balance: fácil + poderoso + rápido

---

## 📖 PARTE 2: INSTALACIÓN PASO A PASO (40 minutos)

### Paso 1: Descargar Python 3.11+

1. Abre https://www.python.org/downloads/
2. Descarga **Python 3.11.x** (o más reciente)
3. En Windows: marca ✅ "Add Python to PATH"
4. Instala normalmente (Next, Next, Finish)

**Verificar instalación:**
```bash
python --version
# Resultado esperado: Python 3.11.x
```

### Paso 2: Instalar VS Code

1. Descargar: https://code.visualstudio.com/
2. Instalar con opciones por defecto
3. Abrir VS Code

### Paso 3: Extensión Python en VS Code

1. Click en Extensions (⬜ icon en lado izquierdo)
2. Buscar "Python"
3. Instalar "Python" de Microsoft
4. Instalar "Pylance" (code intelligence)
5. Instalar "Jupyter" (para notebooks)

**Resultado:** VS Code ahora entiende Python 100%

### Paso 4: Crear carpeta de proyecto

```bash
# En tu terminal/PowerShell
mkdir Mi-Curso-Python
cd Mi-Curso-Python

# Crear entorno virtual (RECOMENDADO)
python -m venv venv

# Activar entorno (Windows)
venv\Scripts\activate

# Activar entorno (Mac/Linux)
source venv/bin/activate

# Resultado: verás (venv) en la terminal
```

### Paso 5: Instalar librerías esenciales

```bash
# Con el entorno virtual activado:
pip install pandas numpy matplotlib seaborn jupyter scipy statsmodels scikit-learn

# Verificar instalación
pip list

# Resultado: verás todas las librerías listadas
```

### Paso 6: Abrir proyecto en VS Code

```bash
# Desde la carpeta del proyecto
code .

# Se abre VS Code en tu carpeta
```

---

## 📖 PARTE 3: TU PRIMER PROGRAMA (20 minutos)

### Crear archivo Python

1. En VS Code: Click derecho → "New File"
2. Nombra el archivo: `hola_mundo.py`
3. Escribe el código:

```python
# Tu primer programa Python
print("¡Hola, Python Data Analyst!")
print("Bienvenido al curso de análisis de datos")

# Variables básicas
nombre = "Luis"
edad = 25
salario = 50000.50

# Imprimir variables
print(f"Nombre: {nombre}")
print(f"Edad: {edad}")
print(f"Salario: ${salario:,.2f}")

# Operaciones matemáticas
promedio = (80 + 90 + 85) / 3
print(f"Promedio de calificaciones: {promedio:.1f}")
```

### Ejecutar el programa

**Opción 1: Click en "Run" (arriba a la derecha)**

**Opción 2: Terminal**
```bash
python hola_mundo.py
```

**Resultado esperado:**
```
¡Hola, Python Data Analyst!
Bienvenido al curso de análisis de datos
Nombre: Luis
Edad: 25
Salario: $50,000.50
Promedio de calificaciones: 85.0
```

✅ **¡Felicidades! Tu entorno funciona perfectamente.**

---

## 📖 PARTE 4: ESTRUCTURA PROFESIONAL DE PROYECTO (30 minutos)

### Crear estructura de carpetas

```bash
Mi-Curso-Python/
├── venv/                    # Entorno virtual
├── data/                    # Datasets (CSV, Excel, etc)
│   ├── raw/                # Datos sin procesar
│   └── processed/          # Datos procesados
├── notebooks/              # Jupyter notebooks
│   └── 01-exploracion.ipynb
├── scripts/                # Scripts Python reutilizables
│   ├── data_loader.py
│   ├── data_cleaner.py
│   └── utils.py
├── results/                # Gráficos, reportes
│   ├── plots/
│   └── reports/
├── requirements.txt        # Lista de librerías
└── README.md              # Descripción del proyecto
```

### Crear requirements.txt

```bash
# En la terminal
pip freeze > requirements.txt
```

**Contenido de requirements.txt:**
```
pandas==2.1.0
numpy==1.24.3
matplotlib==3.7.2
seaborn==0.12.2
jupyter==1.0.0
scipy==1.11.2
statsmodels==0.14.0
scikit-learn==1.3.1
```

### Crear README.md

```markdown
# Mi Primer Proyecto de Data Analysis

## Descripción
Análisis exploratorio de datos de ventas

## Estructura
- `data/`: datasets
- `notebooks/`: análisis exploratorio
- `scripts/`: código reutilizable
- `results/`: gráficos y reportes

## Instalación
```bash
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

## Uso
```bash
jupyter notebook
```
```

---

## 🏋️ EJERCICIOS PRÁCTICOS

### Ejercicio 1: Setup Básico (30 min)
1. ✅ Instalar Python 3.11+
2. ✅ Instalar VS Code + extensión Python
3. ✅ Crear carpeta de proyecto
4. ✅ Crear entorno virtual
5. ✅ Instalar librerías

**Validación:** Ejecuta `python --version` y `pip list`

### Ejercicio 2: Tu primer script (20 min)
1. Crea archivo `bienvenida.py`
2. Escribe un programa que imprima:
   - Tu nombre
   - Tu edad
   - Tu objetivo en data analysis
3. Ejecuta el script

### Ejercicio 3: Estructura profesional (30 min)
1. Crea carpetas: data/, notebooks/, scripts/, results/
2. Crea requirements.txt
3. Crea README.md
4. Valida que VS Code reconoce la estructura

---

## 💼 PROYECTO: Setup Profesional Completo

**Objetivo:** Tener un entorno 100% funcional para los siguientes módulos

**Entregables:**
- ✅ Python 3.11+ instalado
- ✅ VS Code configurado con Python
- ✅ Entorno virtual creado
- ✅ Librerías esenciales instaladas
- ✅ Estructura de carpetas profesional
- ✅ primer_script.py ejecutándose

**Validación:**
```bash
# Desde tu carpeta del proyecto
python -c "import pandas, numpy, matplotlib; print('✅ TODO FUNCIONA')"
```

---

## 🎤 PREGUNTAS DE ENTREVISTA (15 total)

### Nivel Básico (5 preguntas)

**1. ¿Por qué es Python popular para análisis de datos?**
Respuesta esperada:
- Librerías poderosas (pandas, numpy)
- Código legible y fácil de aprender
- Gran comunidad
- Versátil (data science, web, automatización)

**2. ¿Qué es un virtual environment y por qué es importante?**
Respuesta esperada:
- Aislamiento de dependencias por proyecto
- Evita conflictos entre versiones de librerías
- Reproducibilidad en otros equipos
- Buena práctica profesional

**3. ¿Cuál es la diferencia entre pip y conda?**
Respuesta esperada:
- pip: gestor de paquetes Python
- conda: gestor de paquetes + entornos
- conda puede instalar dependencias no-Python
- pip es más ligero y usado por defecto

**4. ¿Qué es Jupyter y para qué se usa?**
Respuesta esperada:
- Notebook interactivo para exploración
- Combina código, output y markdown
- Ideal para análisis exploratorio (EDA)
- Popular en data science

**5. ¿Por qué necesitas requirements.txt?**
Respuesta esperada:
- Reproducibilidad: otro usuario instala las mismas versiones
- Documentación de dependencias
- Control de versiones
- Facilita deployment en producción

### Nivel Intermedio (5 preguntas)

**6. Explica la estructura de un proyecto profesional de data science**

**7. ¿Cuál es la diferencia entre Python 2 y Python 3?**

**8. ¿Qué es pip freeze y para qué sirve?**

**9. ¿Cómo configurarías un proyecto si trabajas en equipo?**

**10. ¿Qué es .gitignore y qué debería contener?**

### Nivel Avanzado (5 preguntas)

**11. Diseña la estructura de un proyecto para un equipo de 5 data analysts**

**12. ¿Cómo asegurarías reproducibilidad de código en diferentes máquinas?**

**13. Explica las diferencias entre conda, virtualenv y poetry**

**14. ¿Cómo versionarías tus datasets y modelos?**

**15. Diseña un workflow completo: desarrollo → testing → producción**

---

## 📚 RECURSOS ADICIONALES

### Documentación oficial
- Python: https://docs.python.org/3/
- Pandas: https://pandas.pydata.org/docs/
- NumPy: https://numpy.org/doc/
- Matplotlib: https://matplotlib.org/stable/contents.html

### Tutoriales recomendados
- Real Python: https://realpython.com/
- DataCamp: https://www.datacamp.com/ (primeras lecciones gratis)
- Kaggle Learn: https://www.kaggle.com/learn (gratis)

### Comunidades LATAM
- Python Chile: https://www.python.cl/
- Python México: https://www.python.mx/
- Python Argentina: https://www.python.org.ar/

---

## ✅ CHECKLIST DE MÓDULO

- [ ] Python 3.11+ instalado
- [ ] VS Code instalado + extensión Python
- [ ] Entorno virtual creado y activado
- [ ] Librerías instaladas (pandas, numpy, matplotlib, etc)
- [ ] Primer script ejecutado correctamente
- [ ] Estructura de carpetas profesional creada
- [ ] requirements.txt generado
- [ ] README.md escrito
- [ ] 5 ejercicios prácticos completados
- [ ] 15 preguntas de entrevista revisadas

**Progreso:** Módulo 1/12 completado ✅

---

## 🚀 SIGUIENTE MÓDULO

**Módulo 2: Variables y Tipos de Datos** (3 horas)
- Strings: manipulación de texto
- Integers: números enteros
- Floats: números decimales
- Booleans: operadores lógicos
- Conversiones entre tipos
- Proyecto: Calculadora de salario con impuestos

*¿Listo? Vamos al Módulo 2 →*
