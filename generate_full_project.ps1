# Define una función para crear los archivos .qmd con la sintaxis correcta.
function New-QuartoPage {
    param (
        [string]$Path,
        [string]$Title,
        [string]$ParentLink = "",
        [string]$BackButtonText = "",
        [array]$ChildItems = @(),
        [string]$IconClass = "bi-file-earmark-text"
    )

    $content = @()
    $content += "---"
    $content += "title: ""$Title"""
    $content += "---"
    $content += ""

    if ($ParentLink) {
        $content += '<div class="navigation-buttons mt-4">'
        $content += "<a href='$ParentLink' class='btn btn-secondary'>$BackButtonText</a>"
        $content += '</div>'
        $content += ""
    }

    if ($ChildItems.Count -gt 0) {
        $content += '<div class="subtopic-grid">'
        foreach ($item in $ChildItems) {
            $content += "<a href='$($item.Link)' class='subtopic-card'>"
            $content += "<span><i class='$IconClass'></i></span>"
            $content += '<div>'
            $content += "<h4>$($item.Name)</h4>"
            $content += '<p>Explora los detalles de este tema clave.</p>'
            $content += '</div>'
            $content += '</a>'
        }
        $content += '</div>'
        $content += ""
    }
    
    if ($ChildItems.Count -eq 0 -and $ParentLink) {
        $content += "<p>Contenido detallado para $Title...</p>"
    }

    $content | Out-File -FilePath $Path -Encoding utf8
}

# ---
# Generación de la estructura de todo el proyecto
# ---

# La ruta de tu proyecto
Set-Location -Path "C:\Users\luisc_0ekf270\OneDrive\Desktop\Github\PlanetSTEAM"

# Borra la estructura anterior si existe (recomendado)
if (Test-Path "academia") { Remove-Item -Recurse -Force -Path ".\academia" }

# Crea la carpeta principal de la academia
New-Item -ItemType Directory -Name "academia" | Out-Null
Push-Location -Path "academia"

# Crea el archivo index.qmd para la página de inicio de la academia
New-QuartoPage -Path "index.qmd" -Title "STEAM Academy Overview" -ParentLink "../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="1. Mathematical and Scientific Fundamentals"; Link="1.-mathematical-scientific-fundamentals/index.qmd"},
    @{Name="2. Computer Science"; Link="2.-computer-science/index.qmd"},
    @{Name="3. Software Development"; Link="3.-software-development/index.qmd"},
    @{Name="4. Artificial Intelligence and Machine Learning"; Link="4.-artificial-intelligence-ml/index.qmd"},
    @{Name="5. Data Science and Engineering"; Link="5.-data-science-engineering/index.qmd"},
    @{Name="6. Cloud Computing and DevOps"; Link="6.-cloud-computing-devops/index.qmd"},
    @{Name="7. Automation and Low-Code/No-Code"; Link="7.-automation-low-code/index.qmd"},
    @{Name="8. Innovation and Emerging Trends"; Link="8.-innovation-emerging-trends/index.qmd"},
    @{Name="9. Business Applications and Management"; Link="9.-business-applications-management/index.qmd"},
    @{Name="10. Research and Academic Publications"; Link="10.-research-academic-publications/index.qmd"}
)

# ... (El resto del script es el mismo que en la respuesta anterior, pero con todas las rutas ParentLink revisadas. Te pido que copies el script completo para asegurar que no haya errores).

# --- Módulo 1 ---
if (-not (Test-Path "1.-mathematical-scientific-fundamentals")) { New-Item -ItemType Directory -Name "1.-mathematical-scientific-fundamentals" | Out-Null }
Push-Location -Path "1.-mathematical-scientific-fundamentals"
New-QuartoPage -Path "index.qmd" -Title "1. Mathematical and Scientific Fundamentals" -ParentLink "../index.qmd" -BackButtonText "Go Back to Overview" -ChildItems @(
    @{Name="1.1 Mathematics"; Link="1.1-mathematics/index.qmd"},
    @{Name="1.2 Statistics and Probability"; Link="1.2-statistics-probability/index.qmd"},
    @{Name="1.3 Natural Sciences"; Link="1.3-natural-sciences/index.qmd"},
    @{Name="1.4 Logic and Computational Thinking"; Link="1.4-logic-computational-thinking/index.qmd"}
)
if (-not (Test-Path "1.1-mathematics")) { New-Item -ItemType Directory -Name "1.1-mathematics" | Out-Null }
Push-Location -Path "1.1-mathematics"
New-QuartoPage -Path "index.qmd" -Title "1.1 Mathematics" -ParentLink "../index.qmd" -BackButtonText "Go Back to Fundamentals" -ChildItems @(
    @{Name="1.1.1 Basic Mathematics"; Link="1.1.1-basic-mathematics/index.qmd"},
    @{Name="1.1.2 Intermediate Mathematics"; Link="1.1.2-intermediate-mathematics/index.qmd"},
    @{Name="1.1.3 Applied Mathematics"; Link="1.1.3-applied-mathematics/index.qmd"}
)
if (-not (Test-Path "1.1.1-basic-mathematics")) { New-Item -ItemType Directory -Name "1.1.1-basic-mathematics" | Out-Null }
Push-Location -Path "1.1.1-basic-mathematics"
New-QuartoPage -Path "index.qmd" -Title "1.1.1 Basic Mathematics" -ParentLink "../index.qmd" -BackButtonText "Go Back to Mathematics" -ChildItems @(
    @{Name="1.1.1.1 Arithmetic and Algebra"; Link="1.1.1.1-arithmetic-algebra.qmd"},
    @{Name="1.1.1.2 Geometry and Trigonometry"; Link="1.1.1.2-geometry-trigonometry.qmd"},
    @{Name="1.1.1.3 Playful Math for Kids"; Link="1.1.1.3-playful-math-kids.qmd"}
)
New-QuartoPage -Path "1.1.1.1-arithmetic-algebra.qmd" -Title "1.1.1.1 Arithmetic and Algebra" -ParentLink "index.qmd" -BackButtonText "Go Back to Basic Mathematics"
New-QuartoPage -Path "1.1.1.2-geometry-trigonometry.qmd" -Title "1.1.1.2 Geometry and Trigonometry" -ParentLink "index.qmd" -BackButtonText "Go Back to Basic Mathematics"
New-QuartoPage -Path "1.1.1.3-playful-math-kids.qmd" -Title "1.1.1.3 Playful Math for Kids" -ParentLink "index.qmd" -BackButtonText "Go Back to Basic Mathematics"
Pop-Location
if (-not (Test-Path "1.1.2-intermediate-mathematics")) { New-Item -ItemType Directory -Name "1.1.2-intermediate-mathematics" | Out-Null }
Push-Location -Path "1.1.2-intermediate-mathematics"
New-QuartoPage -Path "index.qmd" -Title "1.1.2 Intermediate Mathematics" -ParentLink "../index.qmd" -BackButtonText "Go Back to Mathematics" -ChildItems @(
    @{Name="1.1.2.1 Differential and Integral Calculus"; Link="1.1.2.1-calculus.qmd"},
    @{Name="1.1.2.2 Linear Algebra"; Link="1.1.2.2-linear-algebra.qmd"},
    @{Name="1.1.2.3 Differential Equations"; Link="1.1.2.3-differential-equations.qmd"}
)
New-QuartoPage -Path "1.1.2.1-calculus.qmd" -Title "1.1.2.1 Differential and Integral Calculus" -ParentLink "index.qmd" -BackButtonText "Go Back to Intermediate Mathematics"
New-QuartoPage -Path "1.1.2.2-linear-algebra.qmd" -Title "1.1.2.2 Linear Algebra" -ParentLink "index.qmd" -BackButtonText "Go Back to Intermediate Mathematics"
New-QuartoPage -Path "1.1.2.3-differential-equations.qmd" -Title "1.1.2.3 Differential Equations" -ParentLink "index.qmd" -BackButtonText "Go Back to Intermediate Mathematics"
Pop-Location
if (-not (Test-Path "1.1.3-applied-mathematics")) { New-Item -ItemType Directory -Name "1.1.3-applied-mathematics" | Out-Null }
Push-Location -Path "1.1.3-applied-mathematics"
New-QuartoPage -Path "index.qmd" -Title "1.1.3 Applied Mathematics" -ParentLink "../index.qmd" -BackButtonText "Go Back to Mathematics" -ChildItems @(
    @{Name="1.1.3.1 Financial Mathematics"; Link="1.1.3.1-financial-mathematics.qmd"},
    @{Name="1.1.3.2 Discrete Mathematics"; Link="1.1.3.2-discrete-mathematics.qmd"},
    @{Name="1.1.3.3 Numerical Methods"; Link="1.1.3.3-numerical-methods.qmd"}
)
New-QuartoPage -Path "1.1.3.1-financial-mathematics.qmd" -Title "1.1.3.1 Financial Mathematics" -ParentLink "index.qmd" -BackButtonText "Go Back to Applied Mathematics"
New-QuartoPage -Path "1.1.3.2-discrete-mathematics.qmd" -Title "1.1.3.2 Discrete Mathematics" -ParentLink "index.qmd" -BackButtonText "Go Back to Applied Mathematics"
New-QuartoPage -Path "1.1.3.3-numerical-methods.qmd" -Title "1.1.3.3 Numerical Methods" -ParentLink "index.qmd" -BackButtonText "Go Back to Applied Mathematics"
Pop-Location
Pop-Location
if (-not (Test-Path "1.2-statistics-probability")) { New-Item -ItemType Directory -Name "1.2-statistics-probability" | Out-Null }
Push-Location -Path "1.2-statistics-probability"
New-QuartoPage -Path "index.qmd" -Title "1.2 Statistics and Probability" -ParentLink "../index.qmd" -BackButtonText "Go Back to Fundamentals" -ChildItems @(
    @{Name="1.2.1 Descriptive Statistics"; Link="1.2.1-descriptive-statistics.qmd"},
    @{Name="1.2.2 Statistical Inference"; Link="1.2.2-statistical-inference.qmd"},
    @{Name="1.2.3 Bayesian Statistics"; Link="1.2.3-bayesian-statistics.qmd"},
    @{Name="1.2.4 Regression Analysis"; Link="1.2.4-regression-analysis.qmd"}
)
New-QuartoPage -Path "1.2.1-descriptive-statistics.qmd" -Title "1.2.1 Descriptive Statistics" -ParentLink "index.qmd" -BackButtonText "Go Back to Statistics"
New-QuartoPage -Path "1.2.2-statistical-inference.qmd" -Title "1.2.2 Statistical Inference" -ParentLink "index.qmd" -BackButtonText "Go Back to Statistics"
New-QuartoPage -Path "1.2.3-bayesian-statistics.qmd" -Title "1.2.3 Bayesian Statistics" -ParentLink "index.qmd" -BackButtonText "Go Back to Statistics"
New-QuartoPage -Path "1.2.4-regression-analysis.qmd" -Title "1.2.4 Regression Analysis" -ParentLink "index.qmd" -BackButtonText "Go Back to Statistics"
Pop-Location
if (-not (Test-Path "1.3-natural-sciences")) { New-Item -ItemType Directory -Name "1.3-natural-sciences" | Out-Null }
Push-Location -Path "1.3-natural-sciences"
New-QuartoPage -Path "index.qmd" -Title "1.3 Natural Sciences" -ParentLink "../index.qmd" -BackButtonText "Go Back to Fundamentals" -ChildItems @(
    @{Name="1.3.1 Physics"; Link="1.3.1-physics/index.qmd"},
    @{Name="1.3.2 Chemistry"; Link="1.3.2-chemistry/index.qmd"},
    @{Name="1.3.3 Biology"; Link="1.3.3-biology/index.qmd"},
    @{Name="1.3.4 Earth Sciences"; Link="1.3.4-earth-sciences/index.qmd"}
)
if (-not (Test-Path "1.3.1-physics")) { New-Item -ItemType Directory -Name "1.3.1-physics" | Out-Null }
Push-Location -Path "1.3.1-physics"
New-QuartoPage -Path "index.qmd" -Title "1.3.1 Physics" -ParentLink "../index.qmd" -BackButtonText "Go Back to Natural Sciences" -ChildItems @(
    @{Name="1.3.1.1 Classical Mechanics"; Link="1.3.1.1-classical-mechanics.qmd"},
    @{Name="1.3.1.2 Electromagnetism"; Link="1.3.1.2-electromagnetism.qmd"},
    @{Name="1.3.1.3 Thermodynamics"; Link="1.3.1.3-thermodynamics.qmd"},
    @{Name="1.3.1.4 Modern Physics"; Link="1.3.1.4-modern-physics.qmd"}
)
New-QuartoPage -Path "1.3.1.1-classical-mechanics.qmd" -Title "1.3.1.1 Classical Mechanics" -ParentLink "index.qmd" -BackButtonText "Go Back to Physics"
New-QuartoPage -Path "1.3.1.2-electromagnetism.qmd" -Title "1.3.1.2 Electromagnetism" -ParentLink "index.qmd" -BackButtonText "Go Back to Physics"
New-QuartoPage -Path "1.3.1.3-thermodynamics.qmd" -Title "1.3.1.3 Thermodynamics" -ParentLink "index.qmd" -BackButtonText "Go Back to Physics"
New-QuartoPage -Path "1.3.1.4-modern-physics.qmd" -Title "1.3.1.4 Modern Physics" -ParentLink "index.qmd" -BackButtonText "Go Back to Physics"
Pop-Location
if (-not (Test-Path "1.3.2-chemistry")) { New-Item -ItemType Directory -Name "1.3.2-chemistry" | Out-Null }
Push-Location -Path "1.3.2-chemistry"
New-QuartoPage -Path "index.qmd" -Title "1.3.2 Chemistry" -ParentLink "../index.qmd" -BackButtonText "Go Back to Natural Sciences" -ChildItems @(
    @{Name="1.3.2.1 General Chemistry"; Link="1.3.2.1-general-chemistry.qmd"},
    @{Name="1.3.2.2 Organic Chemistry"; Link="1.3.2.2-organic-chemistry.qmd"},
    @{Name="1.3.2.3 Inorganic Chemistry"; Link="1.3.2.3-inorganic-chemistry.qmd"},
    @{Name="1.3.2.4 Analytical Chemistry"; Link="1.3.2.4-analytical-chemistry.qmd"}
)
New-QuartoPage -Path "1.3.2.1-general-chemistry.qmd" -Title "1.3.2.1 General Chemistry" -ParentLink "index.qmd" -BackButtonText "Go Back to Chemistry"
New-QuartoPage -Path "1.3.2.2-organic-chemistry.qmd" -Title "1.3.2.2 Organic Chemistry" -ParentLink "index.qmd" -BackButtonText "Go Back to Chemistry"
New-QuartoPage -Path "1.3.2.3-inorganic-chemistry.qmd" -Title "1.3.2.3 Inorganic Chemistry" -ParentLink "index.qmd" -BackButtonText "Go Back to Chemistry"
New-QuartoPage -Path "1.3.2.4-analytical-chemistry.qmd" -Title "1.3.2.4 Analytical Chemistry" -ParentLink "index.qmd" -BackButtonText "Go Back to Chemistry"
Pop-Location
if (-not (Test-Path "1.3.3-biology")) { New-Item -ItemType Directory -Name "1.3.3-biology" | Out-Null }
Push-Location -Path "1.3.3-biology"
New-QuartoPage -Path "index.qmd" -Title "1.3.3 Biology" -ParentLink "../index.qmd" -BackButtonText "Go Back to Natural Sciences" -ChildItems @(
    @{Name="1.3.3.1 Cell Biology"; Link="1.3.3.1-cell-biology.qmd"},
    @{Name="1.3.3.2 Genetics"; Link="1.3.3.2-genetics.qmd"},
    @{Name="1.3.3.3 Molecular Biology"; Link="1.3.3.3-molecular-biology.qmd"},
    @{Name="1.3.3.4 Bioinformatics"; Link="1.3.3.4-bioinformatics.qmd"}
)
New-QuartoPage -Path "1.3.3.1-cell-biology.qmd" -Title "1.3.3.1 Cell Biology" -ParentLink "index.qmd" -BackButtonText "Go Back to Biology"
New-QuartoPage -Path "1.3.3.2-genetics.qmd" -Title "1.3.3.2 Genetics" -ParentLink "index.qmd" -BackButtonText "Go Back to Biology"
New-QuartoPage -Path "1.3.3.3-molecular-biology.qmd" -Title "1.3.3.3 Molecular Biology" -ParentLink "index.qmd" -BackButtonText "Go Back to Biology"
New-QuartoPage -Path "1.3.3.4-bioinformatics.qmd" -Title "1.3.3.4 Bioinformatics" -ParentLink "index.qmd" -BackButtonText "Go Back to Biology"
Pop-Location
if (-not (Test-Path "1.3.4-earth-sciences")) { New-Item -ItemType Directory -Name "1.3.4-earth-sciences" | Out-Null }
Push-Location -Path "1.3.4-earth-sciences"
New-QuartoPage -Path "index.qmd" -Title "1.3.4 Earth Sciences" -ParentLink "../index.qmd" -BackButtonText "Go Back to Natural Sciences" -ChildItems @(
    @{Name="1.3.4.1 Geology"; Link="1.3.4.1-geology.qmd"},
    @{Name="1.3.4.2 Climatology"; Link="1.3.4.2-climatology.qmd"},
    @{Name="1.3.4.3 Oceanography"; Link="1.3.4.3-oceanography.qmd"}
)
New-QuartoPage -Path "1.3.4.1-geology.qmd" -Title "1.3.4.1 Geology" -ParentLink "index.qmd" -BackButtonText "Go Back to Earth Sciences"
New-QuartoPage -Path "1.3.4.2-climatology.qmd" -Title "1.3.4.2 Climatology" -ParentLink "index.qmd" -BackButtonText "Go Back to Earth Sciences"
New-QuartoPage -Path "1.3.4.3-oceanography.qmd" -Title "1.3.4.3 Oceanography" -ParentLink "index.qmd" -BackButtonText "Go Back to Earth Sciences"
Pop-Location
Pop-Location
if (-not (Test-Path "1.4-logic-computational-thinking")) { New-Item -ItemType Directory -Name "1.4-logic-computational-thinking" | Out-Null }
Push-Location -Path "1.4-logic-computational-thinking"
New-QuartoPage -Path "index.qmd" -Title "1.4 Logic and Computational Thinking" -ParentLink "../index.qmd" -BackButtonText "Go Back to Fundamentals" -ChildItems @(
    @{Name="1.4.1 Algorithms and Data Structures"; Link="1.4.1-algorithms-data-structures.qmd"},
    @{Name="1.4.2 Theory of Computation"; Link="1.4.2-theory-computation.qmd"},
    @{Name="1.4.3 Mathematical Logic"; Link="1.4.3-mathematical-logic.qmd"},
    @{Name="1.4.4 Algorithmic Thinking"; Link="1.4.4-algorithmic-thinking.qmd"}
)
New-QuartoPage -Path "1.4.1-algorithms-data-structures.qmd" -Title "1.4.1 Algorithms and Data Structures" -ParentLink "index.qmd" -BackButtonText "Go Back to Logic and Computational Thinking"
New-QuartoPage -Path "1.4.2-theory-computation.qmd" -Title "1.4.2 Theory of Computation" -ParentLink "index.qmd" -BackButtonText "Go Back to Logic and Computational Thinking"
New-QuartoPage -Path "1.4.3-mathematical-logic.qmd" -Title "1.4.3 Mathematical Logic" -ParentLink "index.qmd" -BackButtonText "Go Back to Logic and Computational Thinking"
New-QuartoPage -Path "1.4.4-algorithmic-thinking.qmd" -Title "1.4.4 Algorithmic Thinking" -ParentLink "index.qmd" -BackButtonText "Go Back to Logic and Computational Thinking"
Pop-Location
Pop-Location

# --- Módulo 2 ---
Pop-Location
if (-not (Test-Path "2.-computer-science")) { New-Item -ItemType Directory -Name "2.-computer-science" | Out-Null }
Push-Location -Path "2.-computer-science"
New-QuartoPage -Path "index.qmd" -Title "2. Computer Science" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="2.1 Programming Fundamentals"; Link="2.1-programming-fundamentals/index.qmd"},
    @{Name="2.2 Programming Languages"; Link="2.2-programming-languages/index.qmd"},
    @{Name="2.3 Data Structures and Algorithms"; Link="2.3-data-structures-algorithms/index.qmd"},
    @{Name="2.4 Systems and Architecture"; Link="2.4-systems-architecture/index.qmd"}
)
if (-not (Test-Path "2.1-programming-fundamentals")) { New-Item -ItemType Directory -Name "2.1-programming-fundamentals" | Out-Null }
Push-Location -Path "2.1-programming-fundamentals"
New-QuartoPage -Path "index.qmd" -Title "2.1 Programming Fundamentals" -ParentLink "../index.qmd" -BackButtonText "Go Back to Computer Science" -ChildItems @(
    @{Name="2.1.1 Basic Concepts"; Link="2.1.1-basic-concepts/index.qmd"},
    @{Name="2.1.2 Object-Oriented Programming"; Link="2.1.2-object-oriented-programming/index.qmd"},
    @{Name="2.1.3 Programming Paradigms"; Link="2.1.3-programming-paradigms/index.qmd"}
)
if (-not (Test-Path "2.1.1-basic-concepts")) { New-Item -ItemType Directory -Name "2.1.1-basic-concepts" | Out-Null }
Push-Location -Path "2.1.1-basic-concepts"
New-QuartoPage -Path "index.qmd" -Title "2.1.1 Basic Concepts" -ParentLink "../index.qmd" -BackButtonText "Go Back to Programming Fundamentals" -ChildItems @(
    @{Name="2.1.1.1 Variables and Data Types"; Link="2.1.1.1-variables-data-types.qmd"},
    @{Name="2.1.1.2 Control Structures"; Link="2.1.1.2-control-structures.qmd"},
    @{Name="2.1.1.3 Functions and Modules"; Link="2.1.1.3-functions-modules.qmd"}
)
New-QuartoPage -Path "2.1.1.1-variables-data-types.qmd" -Title "2.1.1.1 Variables and Data Types" -ParentLink "index.qmd" -BackButtonText "Go Back to Basic Concepts"
New-QuartoPage -Path "2.1.1.2-control-structures.qmd" -Title "2.1.1.2 Control Structures" -ParentLink "index.qmd" -BackButtonText "Go Back to Basic Concepts"
New-QuartoPage -Path "2.1.1.3-functions-modules.qmd" -Title "2.1.1.3 Functions and Modules" -ParentLink "index.qmd" -BackButtonText "Go Back to Basic Concepts"
Pop-Location
if (-not (Test-Path "2.1.2-object-oriented-programming")) { New-Item -ItemType Directory -Name "2.1.2-object-oriented-programming" | Out-Null }
Push-Location -Path "2.1.2-object-oriented-programming"
New-QuartoPage -Path "index.qmd" -Title "2.1.2 Object-Oriented Programming" -ParentLink "../index.qmd" -BackButtonText "Go Back to Programming Fundamentals" -ChildItems @(
    @{Name="2.1.2.1 Classes and Objects"; Link="2.1.2.1-classes-objects.qmd"},
    @{Name="2.1.2.2 Inheritance and Polymorphism"; Link="2.1.2.2-inheritance-polymorphism.qmd"},
    @{Name="2.1.2.3 Encapsulation and Abstraction"; Link="2.1.2.3-encapsulation-abstraction.qmd"}
)
New-QuartoPage -Path "2.1.2.1-classes-objects.qmd" -Title "2.1.2.1 Classes and Objects" -ParentLink "index.qmd" -BackButtonText "Go Back to OOP"
New-QuartoPage -Path "2.1.2.2-inheritance-polymorphism.qmd" -Title "2.1.2.2 Inheritance and Polymorphism" -ParentLink "index.qmd" -BackButtonText "Go Back to OOP"
New-QuartoPage -Path "2.1.2.3-encapsulation-abstraction.qmd" -Title "2.1.2.3 Encapsulation and Abstraction" -ParentLink "index.qmd" -BackButtonText "Go Back to OOP"
Pop-Location
if (-not (Test-Path "2.1.3-programming-paradigms")) { New-Item -ItemType Directory -Name "2.1.3-programming-paradigms" | Out-Null }
Push-Location -Path "2.1.3-programming-paradigms"
New-QuartoPage -Path "index.qmd" -Title "2.1.3 Programming Paradigms" -ParentLink "../index.qmd" -BackButtonText "Go Back to Programming Fundamentals" -ChildItems @(
    @{Name="2.1.3.1 Functional Programming"; Link="2.1.3.1-functional-programming.qmd"},
    @{Name="2.1.3.2 Reactive Programming"; Link="2.1.3.2-reactive-programming.qmd"},
    @{Name="2.1.3.3 Concurrent Programming"; Link="2.1.3.3-concurrent-programming.qmd"}
)
New-QuartoPage -Path "2.1.3.1-functional-programming.qmd" -Title "2.1.3.1 Functional Programming" -ParentLink "index.qmd" -BackButtonText "Go Back to Paradigms"
New-QuartoPage -Path "2.1.3.2-reactive-programming.qmd" -Title "2.1.3.2 Reactive Programming" -ParentLink "index.qmd" -BackButtonText "Go Back to Paradigms"
New-QuartoPage -Path "2.1.3.3-concurrent-programming.qmd" -Title "2.1.3.3 Concurrent Programming" -ParentLink "index.qmd" -BackButtonText "Go Back to Paradigms"
Pop-Location
Pop-Location
if (-not (Test-Path "2.2-programming-languages")) { New-Item -ItemType Directory -Name "2.2-programming-languages" | Out-Null }
Push-Location -Path "2.2-programming-languages"
New-QuartoPage -Path "index.qmd" -Title "2.2 Programming Languages" -ParentLink "../index.qmd" -BackButtonText "Go Back to Computer Science" -ChildItems @(
    @{Name="2.2.1 Interpreted Languages"; Link="2.2.1-interpreted-languages/index.qmd"},
    @{Name="2.2.2 Compiled Languages"; Link="2.2.2-compiled-languages/index.qmd"},
    @{Name="2.2.3 Functional Languages"; Link="2.2.3-functional-languages/index.qmd"},
    @{Name="2.2.4 Query Languages"; Link="2.2.4-query-languages/index.qmd"}
)
if (-not (Test-Path "2.2.1-interpreted-languages")) { New-Item -ItemType Directory -Name "2.2.1-interpreted-languages" | Out-Null }
Push-Location -Path "2.2.1-interpreted-languages"
New-QuartoPage -Path "index.qmd" -Title "2.2.1 Interpreted Languages" -ParentLink "../index.qmd" -BackButtonText "Go Back to Programming Languages" -ChildItems @(
    @{Name="2.2.1.1 Python (Basic → Advanced)"; Link="2.2.1.1-python.qmd"},
    @{Name="2.2.1.2 JavaScript/TypeScript"; Link="2.2.1.2-js-ts.qmd"},
    @{Name="2.2.1.3 R (Statistics)"; Link="2.2.1.3-r.qmd"},
    @{Name="2.2.1.4 PHP"; Link="2.2.1.4-php.qmd"}
)
New-QuartoPage -Path "2.2.1.1-python.qmd" -Title "2.2.1.1 Python" -ParentLink "index.qmd" -BackButtonText "Go Back to Interpreted Languages"
New-QuartoPage -Path "2.2.1.2-js-ts.qmd" -Title "2.2.1.2 JavaScript/TypeScript" -ParentLink "index.qmd" -BackButtonText "Go Back to Interpreted Languages"
New-QuartoPage -Path "2.2.1.3-r.qmd" -Title "2.2.1.3 R (Statistics)" -ParentLink "index.qmd" -BackButtonText "Go Back to Interpreted Languages"
New-QuartoPage -Path "2.2.1.4-php.qmd" -Title "2.2.1.4 PHP" -ParentLink "index.qmd" -BackButtonText "Go Back to Interpreted Languages"
Pop-Location
if (-not (Test-Path "2.2.2-compiled-languages")) { New-Item -ItemType Directory -Name "2.2.2-compiled-languages" | Out-Null }
Push-Location -Path "2.2.2-compiled-languages"
New-QuartoPage -Path "index.qmd" -Title "2.2.2 Compiled Languages" -ParentLink "../index.qmd" -BackButtonText "Go Back to Programming Languages" -ChildItems @(
    @{Name="2.2.2.1 Java"; Link="2.2.2.1-java.qmd"},
    @{Name="2.2.2.2 C/C++"; Link="2.2.2.2-c-cpp.qmd"},
    @{Name="2.2.2.3 Go"; Link="2.2.2.3-go.qmd"},
    @{Name="2.2.2.4 Rust"; Link="2.2.2.4-rust.qmd"}
)
New-QuartoPage -Path "2.2.2.1-java.qmd" -Title "2.2.2.1 Java" -ParentLink "index.qmd" -BackButtonText "Go Back to Compiled Languages"
New-QuartoPage -Path "2.2.2.2-c-cpp.qmd" -Title "2.2.2.2 C/C++" -ParentLink "index.qmd" -BackButtonText "Go Back to Compiled Languages"
New-QuartoPage -Path "2.2.2.3-go.qmd" -Title "2.2.2.3 Go" -ParentLink "index.qmd" -BackButtonText "Go Back to Compiled Languages"
New-QuartoPage -Path "2.2.2.4-rust.qmd" -Title "2.2.2.4 Rust" -ParentLink "index.qmd" -BackButtonText "Go Back to Compiled Languages"
Pop-Location
if (-not (Test-Path "2.2.3-functional-languages")) { New-Item -ItemType Directory -Name "2.2.3-functional-languages" | Out-Null }
Push-Location -Path "2.2.3-functional-languages"
New-QuartoPage -Path "index.qmd" -Title "2.2.3 Functional Languages" -ParentLink "../index.qmd" -BackButtonText "Go Back to Programming Languages" -ChildItems @(
    @{Name="2.2.3.1 Scala"; Link="2.2.3.1-scala.qmd"},
    @{Name="2.2.3.2 Haskell"; Link="2.2.3.2-haskell.qmd"},
    @{Name="2.2.3.3 Julia"; Link="2.2.3.3-julia.qmd"}
)
New-QuartoPage -Path "2.2.3.1-scala.qmd" -Title "2.2.3.1 Scala" -ParentLink "index.qmd" -BackButtonText "Go Back to Functional Languages"
New-QuartoPage -Path "2.2.3.2-haskell.qmd" -Title "2.2.3.2 Haskell" -ParentLink "index.qmd" -BackButtonText "Go Back to Functional Languages"
New-QuartoPage -Path "2.2.3.3-julia.qmd" -Title "2.2.3.3 Julia" -ParentLink "index.qmd" -BackButtonText "Go Back to Functional Languages"
Pop-Location
if (-not (Test-Path "2.2.4-query-languages")) { New-Item -ItemType Directory -Name "2.2.4-query-languages" | Out-Null }
Push-Location -Path "2.2.4-query-languages"
New-QuartoPage -Path "index.qmd" -Title "2.2.4 Query Languages" -ParentLink "../index.qmd" -BackButtonText "Go Back to Programming Languages" -ChildItems @(
    @{Name="2.2.4.1 SQL (Basic → Advanced)"; Link="2.2.4.1-sql.qmd"},
    @{Name="2.2.4.2 NoSQL (MongoDB, etc.)"; Link="2.2.4.2-nosql.qmd"},
    @{Name="2.2.4.3 GraphQL"; Link="2.2.4.3-graphql.qmd"}
)
New-QuartoPage -Path "2.2.4.1-sql.qmd" -Title "2.2.4.1 SQL (Basic → Advanced)" -ParentLink "index.qmd" -BackButtonText "Go Back to Query Languages"
New-QuartoPage -Path "2.2.4.2-nosql.qmd" -Title "2.2.4.2 NoSQL (MongoDB, etc.)" -ParentLink "index.qmd" -BackButtonText "Go Back to Query Languages"
New-QuartoPage -Path "2.2.4.3-graphql.qmd" -Title "2.2.4.3 GraphQL" -ParentLink "index.qmd" -BackButtonText "Go Back to Query Languages"
Pop-Location
Pop-Location
if (-not (Test-Path "2.3-data-structures-algorithms")) { New-Item -ItemType Directory -Name "2.3-data-structures-algorithms" | Out-Null }
Push-Location -Path "2.3-data-structures-algorithms"
New-QuartoPage -Path "index.qmd" -Title "2.3 Data Structures and Algorithms" -ParentLink "../index.qmd" -BackButtonText "Go Back to Computer Science" -ChildItems @(
    @{Name="2.3.1 Linear Structures"; Link="2.3.1-linear-structures/index.qmd"},
    @{Name="2.3.2 Non-Linear Structures"; Link="2.3.2-non-linear-structures/index.qmd"},
    @{Name="2.3.3 Algorithms"; Link="2.3.3-algorithms/index.qmd"}
)
if (-not (Test-Path "2.3.1-linear-structures")) { New-Item -ItemType Directory -Name "2.3.1-linear-structures" | Out-Null }
Push-Location -Path "2.3.1-linear-structures"
New-QuartoPage -Path "index.qmd" -Title "2.3.1 Linear Structures" -ParentLink "../index.qmd" -BackButtonText "Go Back to Data Structures and Algorithms" -ChildItems @(
    @{Name="2.3.1.1 Arrays and Lists"; Link="2.3.1.1-arrays-lists.qmd"},
    @{Name="2.3.1.2 Stacks and Queues"; Link="2.3.1.2-stacks-queues.qmd"},
    @{Name="2.3.1.3 Linked Lists"; Link="2.3.1.3-linked-lists.qmd"}
)
New-QuartoPage -Path "2.3.1.1-arrays-lists.qmd" -Title "2.3.1.1 Arrays and Lists" -ParentLink "index.qmd" -BackButtonText "Go Back to Linear Structures"
New-QuartoPage -Path "2.3.1.2-stacks-queues.qmd" -Title "2.3.1.2 Stacks and Queues" -ParentLink "index.qmd" -BackButtonText "Go Back to Linear Structures"
New-QuartoPage -Path "2.3.1.3-linked-lists.qmd" -Title "2.3.1.3 Linked Lists" -ParentLink "index.qmd" -BackButtonText "Go Back to Linear Structures"
Pop-Location
if (-not (Test-Path "2.3.2-non-linear-structures")) { New-Item -ItemType Directory -Name "2.3.2-non-linear-structures" | Out-Null }
Push-Location -Path "2.3.2-non-linear-structures"
New-QuartoPage -Path "index.qmd" -Title "2.3.2 Non-Linear Structures" -ParentLink "../index.qmd" -BackButtonText "Go Back to Data Structures and Algorithms" -ChildItems @(
    @{Name="2.3.2.1 Trees"; Link="2.3.2.1-trees.qmd"},
    @{Name="2.3.2.2 Graphs"; Link="2.3.2.2-graphs.qmd"},
    @{Name="2.3.2.3 Hash Tables"; Link="2.3.2.3-hash-tables.qmd"}
)
New-QuartoPage -Path "2.3.2.1-trees.qmd" -Title "2.3.2.1 Trees" -ParentLink "index.qmd" -BackButtonText "Go Back to Non-Linear Structures"
New-QuartoPage -Path "2.3.2.2-graphs.qmd" -Title "2.3.2.2 Graphs" -ParentLink "index.qmd" -BackButtonText "Go Back to Non-Linear Structures"
New-QuartoPage -Path "2.3.2.3-hash-tables.qmd" -Title "2.3.2.3 Hash Tables" -ParentLink "index.qmd" -BackButtonText "Go Back to Non-Linear Structures"
Pop-Location
if (-not (Test-Path "2.3.3-algorithms")) { New-Item -ItemType Directory -Name "2.3.3-algorithms" | Out-Null }
Push-Location -Path "2.3.3-algorithms"
New-QuartoPage -Path "index.qmd" -Title "2.3.3 Algorithms" -ParentLink "../index.qmd" -BackButtonText "Go Back to Data Structures and Algorithms" -ChildItems @(
    @{Name="2.3.3.1 Sorting and Searching"; Link="2.3.3.1-sorting-searching.qmd"},
    @{Name="2.3.3.2 Graph Algorithms"; Link="2.3.3.2-graph-algorithms.qmd"},
    @{Name="2.3.3.3 Dynamic Programming"; Link="2.3.3.3-dynamic-programming.qmd"}
)
New-QuartoPage -Path "2.3.3.1-sorting-searching.qmd" -Title "2.3.3.1 Sorting and Searching" -ParentLink "index.qmd" -BackButtonText "Go Back to Algorithms"
New-QuartoPage -Path "2.3.3.2-graph-algorithms.qmd" -Title "2.3.3.2 Graph Algorithms" -ParentLink "index.qmd" -BackButtonText "Go Back to Algorithms"
New-QuartoPage -Path "2.3.3.3-dynamic-programming.qmd" -Title "2.3.3.3 Dynamic Programming" -ParentLink "index.qmd" -BackButtonText "Go Back to Algorithms"
Pop-Location
Pop-Location
if (-not (Test-Path "2.4-systems-architecture")) { New-Item -ItemType Directory -Name "2.4-systems-architecture" | Out-Null }
Push-Location -Path "2.4-systems-architecture"
New-QuartoPage -Path "index.qmd" -Title "2.4 Systems and Architecture" -ParentLink "../index.qmd" -BackButtonText "Go Back to Computer Science" -ChildItems @(
    @{Name="2.4.1 Operating Systems"; Link="2.4.1-operating-systems.qmd"},
    @{Name="2.4.2 Computer Networks"; Link="2.4.2-computer-networks.qmd"},
    @{Name="2.4.3 Software Architecture"; Link="2.4.3-software-architecture.qmd"},
    @{Name="2.4.4 Databases"; Link="2.4.4-databases.qmd"}
)
New-QuartoPage -Path "2.4.1-operating-systems.qmd" -Title "2.4.1 Operating Systems" -ParentLink "index.qmd" -BackButtonText "Go Back to Systems and Architecture"
New-QuartoPage -Path "2.4.2-computer-networks.qmd" -Title "2.4.2 Computer Networks" -ParentLink "index.qmd" -BackButtonText "Go Back to Systems and Architecture"
New-QuartoPage -Path "2.4.3-software-architecture.qmd" -Title "2.4.3 Software Architecture" -ParentLink "index.qmd" -BackButtonText "Go Back to Systems and Architecture"
New-QuartoPage -Path "2.4.4-databases.qmd" -Title "2.4.4 Databases" -ParentLink "index.qmd" -BackButtonText "Go Back to Systems and Architecture"
Pop-Location
Pop-Location

# --- Módulo 3 ---
Pop-Location
if (-not (Test-Path "3.-software-development")) { New-Item -ItemType Directory -Name "3.-software-development" | Out-Null }
Push-Location -Path "3.-software-development"
New-QuartoPage -Path "index.qmd" -Title "3. Software Development" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="3.1 Web Development"; Link="3.1-web-development/index.qmd"},
    @{Name="3.2 Mobile Development"; Link="3.2-mobile-development/index.qmd"},
    @{Name="3.3 Desktop Application Development"; Link="3.3-desktop-app-development/index.qmd"},
    @{Name="3.4 Game Development"; Link="3.4-game-development/index.qmd"},
    @{Name="3.5 APIs and Microservices"; Link="3.5-apis-microservices/index.qmd"}
)
if (-not (Test-Path "3.1-web-development")) { New-Item -ItemType Directory -Name "3.1-web-development" | Out-Null }
Push-Location -Path "3.1-web-development"
New-QuartoPage -Path "index.qmd" -Title "3.1 Web Development" -ParentLink "../index.qmd" -BackButtonText "Go Back to Software Development" -ChildItems @(
    @{Name="3.1.1 Frontend"; Link="3.1.1-frontend/index.qmd"},
    @{Name="3.1.2 Backend"; Link="3.1.2-backend/index.qmd"},
    @{Name="3.1.3 Full Stack"; Link="3.1.3-full-stack/index.qmd"}
)
if (-not (Test-Path "3.1.1-frontend")) { New-Item -ItemType Directory -Name "3.1.1-frontend" | Out-Null }
Push-Location -Path "3.1.1-frontend"
New-QuartoPage -Path "index.qmd" -Title "3.1.1 Frontend" -ParentLink "../index.qmd" -BackButtonText "Go Back to Web Development" -ChildItems @(
    @{Name="3.1.1.1 Fundamentals (HTML, CSS, JavaScript)"; Link="3.1.1.1-fundamentals.qmd"},
    @{Name="3.1.1.2 Modern Frameworks"; Link="3.1.1.2-modern-frameworks/index.qmd"},
    @{Name="3.1.1.3 CSS Frameworks (Tailwind, Bootstrap)"; Link="3.1.1.3-css-frameworks.qmd"}
)
New-QuartoPage -Path "3.1.1.1-fundamentals.qmd" -Title "3.1.1.1 Fundamentals (HTML, CSS, JavaScript)" -ParentLink "index.qmd" -BackButtonText "Go Back to Frontend"
if (-not (Test-Path "3.1.1.2-modern-frameworks")) { New-Item -ItemType Directory -Name "3.1.1.2-modern-frameworks" | Out-Null }
Push-Location -Path "3.1.1.2-modern-frameworks"
New-QuartoPage -Path "index.qmd" -Title "3.1.1.2 Modern Frameworks" -ParentLink "../index.qmd" -BackButtonText "Go Back to Frontend" -ChildItems @(
    @{Name="3.1.1.2.1 React/Next.js"; Link="3.1.1.2.1-react-nextjs.qmd"},
    @{Name="3.1.1.2.2 Vue.js/Nuxt.js"; Link="3.1.1.2.2-vue-nuxt.qmd"},
    @{Name="3.1.1.2.3 Angular"; Link="3.1.1.2.3-angular.qmd"},
    @{Name="3.1.1.2.4 Svelte/SvelteKit"; Link="3.1.1.2.4-svelte-sveltekit.qmd"}
)
New-QuartoPage -Path "3.1.1.2.1-react-nextjs.qmd" -Title "3.1.1.2.1 React/Next.js" -ParentLink "index.qmd" -BackButtonText "Go Back to Modern Frameworks"
New-QuartoPage -Path "3.1.1.2.2-vue-nuxt.qmd" -Title "3.1.1.2.2 Vue.js/Nuxt.js" -ParentLink "index.qmd" -BackButtonText "Go Back to Modern Frameworks"
New-QuartoPage -Path "3.1.1.2.3-angular.qmd" -Title "3.1.1.2.3 Angular" -ParentLink "index.qmd" -BackButtonText "Go Back to Modern Frameworks"
New-QuartoPage -Path "3.1.1.2.4-svelte-sveltekit.qmd" -Title "3.1.1.2.4 Svelte/SvelteKit" -ParentLink "index.qmd" -BackButtonText "Go Back to Modern Frameworks"
Pop-Location
New-QuartoPage -Path "3.1.1.3-css-frameworks.qmd" -Title "3.1.1.3 CSS Frameworks (Tailwind, Bootstrap)" -ParentLink "index.qmd" -BackButtonText "Go Back to Frontend"
Pop-Location
if (-not (Test-Path "3.1.2-backend")) { New-Item -ItemType Directory -Name "3.1.2-backend" | Out-Null }
Push-Location -Path "3.1.2-backend"
New-QuartoPage -Path "index.qmd" -Title "3.1.2 Backend" -ParentLink "../index.qmd" -BackButtonText "Go Back to Web Development" -ChildItems @(
    @{Name="3.1.2.1 Node.js/Express"; Link="3.1.2.1-nodejs-express.qmd"},
    @{Name="3.1.2.2 Python (Django/Flask/FastAPI)"; Link="3.1.2.2-python-web.qmd"},
    @{Name="3.1.2.3 Java (Spring Boot)"; Link="3.1.2.3-java-spring.qmd"},
    @{Name="3.1.2.4 .NET Core"; Link="3.1.2.4-dotnet-core.qmd"}
)
New-QuartoPage -Path "3.1.2.1-nodejs-express.qmd" -Title "3.1.2.1 Node.js/Express" -ParentLink "index.qmd" -BackButtonText "Go Back to Backend"
New-QuartoPage -Path "3.1.2.2-python-web.qmd" -Title "3.1.2.2 Python (Django/Flask/FastAPI)" -ParentLink "index.qmd" -BackButtonText "Go Back to Backend"
New-QuartoPage -Path "3.1.2.3-java-spring.qmd" -Title "3.1.2.3 Java (Spring Boot)" -ParentLink "index.qmd" -BackButtonText "Go Back to Backend"
New-QuartoPage -Path "3.1.2.4-dotnet-core.qmd" -Title "3.1.2.4 .NET Core" -ParentLink "index.qmd" -BackButtonText "Go Back to Backend"
Pop-Location
if (-not (Test-Path "3.1.3-full-stack")) { New-Item -ItemType Directory -Name "3.1.3-full-stack" | Out-Null }
Push-Location -Path "3.1.3-full-stack"
New-QuartoPage -Path "index.qmd" -Title "3.1.3 Full Stack" -ParentLink "../index.qmd" -BackButtonText "Go Back to Web Development" -ChildItems @(
    @{Name="3.1.3.1 MEAN/MERN Stack"; Link="3.1.3.1-mean-mern.qmd"},
    @{Name="3.1.3.2 JAMstack"; Link="3.1.3.2-jamstack.qmd"},
    @{Name="3.1.3.3 Serverless Architecture"; Link="3.1.3.3-serverless.qmd"}
)
New-QuartoPage -Path "3.1.3.1-mean-mern.qmd" -Title "3.1.3.1 MEAN/MERN Stack" -ParentLink "index.qmd" -BackButtonText "Go Back to Full Stack"
New-QuartoPage -Path "3.1.3.2-jamstack.qmd" -Title "3.1.3.2 JAMstack" -ParentLink "index.qmd" -BackButtonText "Go Back to Full Stack"
New-QuartoPage -Path "3.1.3.3-serverless.qmd" -Title "3.1.3.3 Serverless Architecture" -ParentLink "index.qmd" -BackButtonText "Go Back to Full Stack"
Pop-Location
Pop-Location
Pop-Location

# --- Módulo 4 ---
Pop-Location
if (-not (Test-Path "4.-artificial-intelligence-ml")) { New-Item -ItemType Directory -Name "4.-artificial-intelligence-ml" | Out-Null }
Push-Location -Path "4.-artificial-intelligence-ml"
New-QuartoPage -Path "index.qmd" -Title "4. Artificial Intelligence and Machine Learning" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="4.1 AI Fundamentals"; Link="4.1-ai-fundamentals/index.qmd"},
    @{Name="4.2 Machine Learning"; Link="4.2-machine-learning/index.qmd"},
    @{Name="4.3 Deep Learning"; Link="4.3-deep-learning/index.qmd"},
    @{Name="4.4 Specialized AI"; Link="4.4-specialized-ai/index.qmd"},
    @{Name="4.5 Generative AI"; Link="4.5-generative-ai/index.qmd"},
    @{Name="4.6 Tools and Frameworks"; Link="4.6-tools-frameworks/index.qmd"},
    @{Name="4.7 MLOps and Production"; Link="4.7-mlops-production/index.qmd"}
)
if (-not (Test-Path "4.1-ai-fundamentals")) { New-Item -ItemType Directory -Name "4.1-ai-fundamentals" | Out-Null }
Push-Location -Path "4.1-ai-fundamentals"
New-QuartoPage -Path "index.qmd" -Title "4.1 AI Fundamentals" -ParentLink "../index.qmd" -BackButtonText "Go Back to AI and ML" -ChildItems @(
    @{Name="4.1.1 History and Concepts"; Link="4.1.1-history-concepts.qmd"},
    @{Name="4.1.2 Branches of AI"; Link="4.1.2-branches-ai.qmd"},
    @{Name="4.1.3 AI Ethics"; Link="4.1.3-ai-ethics.qmd"}
)
New-QuartoPage -Path "4.1.1-history-concepts.qmd" -Title "4.1.1 History and Concepts" -ParentLink "index.qmd" -BackButtonText "Go Back to AI Fundamentals"
New-QuartoPage -Path "4.1.2-branches-ai.qmd" -Title "4.1.2 Branches of AI" -ParentLink "index.qmd" -BackButtonText "Go Back to AI Fundamentals"
New-QuartoPage -Path "4.1.3-ai-ethics.qmd" -Title "4.1.3 AI Ethics" -ParentLink "index.qmd" -BackButtonText "Go Back to AI Fundamentals"
Pop-Location
if (-not (Test-Path "4.2-machine-learning")) { New-Item -ItemType Directory -Name "4.2-machine-learning" | Out-Null }
Push-Location -Path "4.2-machine-learning"
New-QuartoPage -Path "index.qmd" -Title "4.2 Machine Learning" -ParentLink "../index.qmd" -BackButtonText "Go Back to AI and ML" -ChildItems @(
    @{Name="4.2.1 Supervised Learning"; Link="4.2.1-supervised-learning/index.qmd"},
    @{Name="4.2.2 Unsupervised Learning"; Link="4.2.2-unsupervised-learning/index.qmd"},
    @{Name="4.2.3 Reinforcement Learning"; Link="4.2.3-reinforcement-learning/index.qmd"}
)
if (-not (Test-Path "4.2.1-supervised-learning")) { New-Item -ItemType Directory -Name "4.2.1-supervised-learning" | Out-Null }
Push-Location -Path "4.2.1-supervised-learning"
New-QuartoPage -Path "index.qmd" -Title "4.2.1 Supervised Learning" -ParentLink "../index.qmd" -BackButtonText "Go Back to Machine Learning" -ChildItems @(
    @{Name="4.2.1.1 Regression"; Link="4.2.1.1-regression.qmd"},
    @{Name="4.2.1.2 Classification"; Link="4.2.1.2-classification.qmd"}
)
New-QuartoPage -Path "4.2.1.1-regression.qmd" -Title "4.2.1.1 Regression" -ParentLink "index.qmd" -BackButtonText "Go Back to Supervised Learning"
New-QuartoPage -Path "4.2.1.2-classification.qmd" -Title "4.2.1.2 Classification" -ParentLink "index.qmd" -BackButtonText "Go Back to Supervised Learning"
Pop-Location
if (-not (Test-Path "4.2.2-unsupervised-learning")) { New-Item -ItemType Directory -Name "4.2.2-unsupervised-learning" | Out-Null }
Push-Location -Path "4.2.2-unsupervised-learning"
New-QuartoPage -Path "index.qmd" -Title "4.2.2 Unsupervised Learning" -ParentLink "../index.qmd" -BackButtonText "Go Back to Machine Learning" -ChildItems @(
    @{Name="4.2.2.1 Clustering"; Link="4.2.2.1-clustering.qmd"},
    @{Name="4.2.2.2 Dimensionality Reduction"; Link="4.2.2.2-dimensionality-reduction.qmd"}
)
New-QuartoPage -Path "4.2.2.1-clustering.qmd" -Title "4.2.2.1 Clustering" -ParentLink "index.qmd" -BackButtonText "Go Back to Unsupervised Learning"
New-QuartoPage -Path "4.2.2.2-dimensionality-reduction.qmd" -Title "4.2.2.2 Dimensionality Reduction" -ParentLink "index.qmd" -BackButtonText "Go Back to Unsupervised Learning"
Pop-Location
if (-not (Test-Path "4.2.3-reinforcement-learning")) { New-Item -ItemType Directory -Name "4.2.3-reinforcement-learning" | Out-Null }
Push-Location -Path "4.2.3-reinforcement-learning"
New-QuartoPage -Path "index.qmd" -Title "4.2.3 Reinforcement Learning" -ParentLink "../index.qmd" -BackButtonText "Go Back to Machine Learning" -ChildItems @(
    @{Name="4.2.3.1 Basics and Applications"; Link="4.2.3.1-basics-applications.qmd"}
)
New-QuartoPage -Path "4.2.3.1-basics-applications.qmd" -Title "4.2.3.1 Basics and Applications" -ParentLink "index.qmd" -BackButtonText "Go Back to Reinforcement Learning"
Pop-Location
Pop-Location
if (-not (Test-Path "4.3-deep-learning")) { New-Item -ItemType Directory -Name "4.3-deep-learning" | Out-Null }
Push-Location -Path "4.3-deep-learning"
New-QuartoPage -Path "index.qmd" -Title "4.3 Deep Learning" -ParentLink "../index.qmd" -BackButtonText "Go Back to AI and ML" -ChildItems @(
    @{Name="4.3.1 Neural Networks"; Link="4.3.1-neural-networks/index.qmd"},
    @{Name="4.3.2 Convolutional Neural Networks (CNNs)"; Link="4.3.2-cnns/index.qmd"},
    @{Name="4.3.3 Recurrent Neural Networks (RNNs)"; Link="4.3.3-rnns/index.qmd"},
    @{Name="4.3.4 Transformers"; Link="4.3.4-transformers/index.qmd"}
)
if (-not (Test-Path "4.3.1-neural-networks")) { New-Item -ItemType Directory -Name "4.3.1-neural-networks" | Out-Null }
Push-Location -Path "4.3.1-neural-networks"
New-QuartoPage -Path "index.qmd" -Title "4.3.1 Neural Networks" -ParentLink "../index.qmd" -BackButtonText "Go Back to Deep Learning" -ChildItems @(
    @{Name="4.3.1.1 Fundamentals and Architectures"; Link="4.3.1.1-fundamentals-architectures.qmd"}
)
New-QuartoPage -Path "4.3.1.1-fundamentals-architectures.qmd" -Title "4.3.1.1 Fundamentals and Architectures" -ParentLink "index.qmd" -BackButtonText "Go Back to Neural Networks"
Pop-Location
if (-not (Test-Path "4.3.2-cnns")) { New-Item -ItemType Directory -Name "4.3.2-cnns" | Out-Null }
Push-Location -Path "4.3.2-cnns"
New-QuartoPage -Path "index.qmd" -Title "4.3.2 Convolutional Neural Networks (CNNs)" -ParentLink "../index.qmd" -BackButtonText "Go Back to Deep Learning" -ChildItems @(
    @{Name="4.3.2.1 Image Recognition"; Link="4.3.2.1-image-recognition.qmd"}
)
New-QuartoPage -Path "4.3.2.1-image-recognition.qmd" -Title "4.3.2.1 Image Recognition" -ParentLink "index.qmd" -BackButtonText "Go Back to CNNs"
Pop-Location
if (-not (Test-Path "4.3.3-rnns")) { New-Item -ItemType Directory -Name "4.3.3-rnns" | Out-Null }
Push-Location -Path "4.3.3-rnns"
New-QuartoPage -Path "index.qmd" -Title "4.3.3 Recurrent Neural Networks (RNNs)" -ParentLink "../index.qmd" -BackButtonText "Go Back to Deep Learning" -ChildItems @(
    @{Name="4.3.3.1 Natural Language Processing"; Link="4.3.3.1-nlp.qmd"}
)
New-QuartoPage -Path "4.3.3.1-nlp.qmd" -Title "4.3.3.1 Natural Language Processing" -ParentLink "index.qmd" -BackButtonText "Go Back to RNNs"
Pop-Location
if (-not (Test-Path "4.3.4-transformers")) { New-Item -ItemType Directory -Name "4.3.4-transformers" | Out-Null }
Push-Location -Path "4.3.4-transformers"
New-QuartoPage -Path "index.qmd" -Title "4.3.4 Transformers" -ParentLink "../index.qmd" -BackButtonText "Go Back to Deep Learning" -ChildItems @(
    @{Name="4.3.4.1 Attention Mechanism"; Link="4.3.4.1-attention-mechanism.qmd"}
)
New-QuartoPage -Path "4.3.4.1-attention-mechanism.qmd" -Title "4.3.4.1 Attention Mechanism" -ParentLink "index.qmd" -BackButtonText "Go Back to Transformers"
Pop-Location
Pop-Location
if (-not (Test-Path "4.4-specialized-ai")) { New-Item -ItemType Directory -Name "4.4-specialized-ai" | Out-Null }
Push-Location -Path "4.4-specialized-ai"
New-QuartoPage -Path "index.qmd" -Title "4.4 Specialized AI" -ParentLink "../index.qmd" -BackButtonText "Go Back to AI and ML" -ChildItems @(
    @{Name="4.4.1 Computer Vision"; Link="4.4.1-computer-vision.qmd"},
    @{Name="4.4.2 Natural Language Processing (NLP)"; Link="4.4.2-nlp.qmd"},
    @{Name="4.4.3 Robotics"; Link="4.4.3-robotics.qmd"}
)
New-QuartoPage -Path "4.4.1-computer-vision.qmd" -Title "4.4.1 Computer Vision" -ParentLink "index.qmd" -BackButtonText "Go Back to Specialized AI"
New-QuartoPage -Path "4.4.2-nlp.qmd" -Title "4.4.2 Natural Language Processing (NLP)" -ParentLink "index.qmd" -BackButtonText "Go Back to Specialized AI"
New-QuartoPage -Path "4.4.3-robotics.qmd" -Title "4.4.3 Robotics" -ParentLink "index.qmd" -BackButtonText "Go Back to Specialized AI"
Pop-Location
if (-not (Test-Path "4.5-generative-ai")) { New-Item -ItemType Directory -Name "4.5-generative-ai" | Out-Null }
Push-Location -Path "4.5-generative-ai"
New-QuartoPage -Path "index.qmd" -Title "4.5 Generative AI" -ParentLink "../index.qmd" -BackButtonText "Go Back to AI and ML" -ChildItems @(
    @{Name="4.5.1 GANs (Generative Adversarial Networks)"; Link="4.5.1-gans.qmd"},
    @{Name="4.5.2 VAEs (Variational Autoencoders)"; Link="4.5.2-vaes.qmd"},
    @{Name="4.5.3 Diffusion Models"; Link="4.5.3-diffusion-models.qmd"}
)
New-QuartoPage -Path "4.5.1-gans.qmd" -Title "4.5.1 GANs" -ParentLink "index.qmd" -BackButtonText "Go Back to Generative AI"
New-QuartoPage -Path "4.5.2-vaes.qmd" -Title "4.5.2 VAEs" -ParentLink "index.qmd" -BackButtonText "Go Back to Generative AI"
New-QuartoPage -Path "4.5.3-diffusion-models.qmd" -Title "4.5.3 Diffusion Models" -ParentLink "index.qmd" -BackButtonText "Go Back to Generative AI"
Pop-Location
if (-not (Test-Path "4.6-tools-frameworks")) { New-Item -ItemType Directory -Name "4.6-tools-frameworks" | Out-Null }
Push-Location -Path "4.6-tools-frameworks"
New-QuartoPage -Path "index.qmd" -Title "4.6 Tools and Frameworks" -ParentLink "../index.qmd" -BackButtonText "Go Back to AI and ML" -ChildItems @(
    @{Name="4.6.1 TensorFlow/Keras"; Link="4.6.1-tensorflow-keras.qmd"},
    @{Name="4.6.2 PyTorch"; Link="4.6.2-pytorch.qmd"},
    @{Name="4.6.3 Scikit-learn"; Link="4.6.3-scikit-learn.qmd"}
)
New-QuartoPage -Path "4.6.1-tensorflow-keras.qmd" -Title "4.6.1 TensorFlow/Keras" -ParentLink "index.qmd" -BackButtonText "Go Back to Tools and Frameworks"
New-QuartoPage -Path "4.6.2-pytorch.qmd" -Title "4.6.2 PyTorch" -ParentLink "index.qmd" -BackButtonText "Go Back to Tools and Frameworks"
New-QuartoPage -Path "4.6.3-scikit-learn.qmd" -Title "4.6.3 Scikit-learn" -ParentLink "index.qmd" -BackButtonText "Go Back to Tools and Frameworks"
Pop-Location
if (-not (Test-Path "4.7-mlops-production")) { New-Item -ItemType Directory -Name "4.7-mlops-production" | Out-Null }
Push-Location -Path "4.7-mlops-production"
New-QuartoPage -Path "index.qmd" -Title "4.7 MLOps and Production" -ParentLink "../index.qmd" -BackButtonText "Go Back to AI and ML" -ChildItems @(
    @{Name="4.7.1 Model Deployment"; Link="4.7.1-model-deployment.qmd"},
    @{Name="4.7.2 Monitoring"; Link="4.7.2-monitoring.qmd"}
)
New-QuartoPage -Path "4.7.1-model-deployment.qmd" -Title "4.7.1 Model Deployment" -ParentLink "index.qmd" -BackButtonText "Go Back to MLOps"
New-QuartoPage -Path "4.7.2-monitoring.qmd" -Title "4.7.2 Monitoring" -ParentLink "index.qmd" -BackButtonText "Go Back to MLOps"
Pop-Location
Pop-Location

# --- Módulo 5 ---
Pop-Location
if (-not (Test-Path "5.-data-science-engineering")) { New-Item -ItemType Directory -Name "5.-data-science-engineering" | Out-Null }
Push-Location -Path "5.-data-science-engineering"
New-QuartoPage -Path "index.qmd" -Title "5. Data Science and Engineering" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="5.1 Data Science Fundamentals"; Link="5.1-data-science-fundamentals/index.qmd"},
    @{Name="5.2 Data Engineering"; Link="5.2-data-engineering/index.qmd"},
    @{Name="5.3 Big Data"; Link="5.3-big-data/index.qmd"},
    @{Name="5.4 Data Visualization"; Link="5.4-data-visualization/index.qmd"},
    @{Name="5.5 Business Intelligence (BI)"; Link="5.5-business-intelligence/index.qmd"}
)
if (-not (Test-Path "5.1-data-science-fundamentals")) { New-Item -ItemType Directory -Name "5.1-data-science-fundamentals" | Out-Null }
Push-Location -Path "5.1-data-science-fundamentals"
New-QuartoPage -Path "index.qmd" -Title "5.1 Data Science Fundamentals" -ParentLink "../index.qmd" -BackButtonText "Go Back to Data Science" -ChildItems @(
    @{Name="5.1.1 CRISP-DM Methodology"; Link="5.1.1-crisp-dm.qmd"},
    @{Name="5.1.2 Python for Data Science"; Link="5.1.2-python-data-science.qmd"},
    @{Name="5.1.3 R for Data Science"; Link="5.1.3-r-data-science.qmd"}
)
New-QuartoPage -Path "5.1.1-crisp-dm.qmd" -Title "5.1.1 CRISP-DM Methodology" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Science Fundamentals"
New-QuartoPage -Path "5.1.2-python-data-science.qmd" -Title "5.1.2 Python for Data Science" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Science Fundamentals"
New-QuartoPage -Path "5.1.3-r-data-science.qmd" -Title "5.1.3 R for Data Science" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Science Fundamentals"
Pop-Location
if (-not (Test-Path "5.2-data-engineering")) { New-Item -ItemType Directory -Name "5.2-data-engineering" | Out-Null }
Push-Location -Path "5.2-data-engineering"
New-QuartoPage -Path "index.qmd" -Title "5.2 Data Engineering" -ParentLink "../index.qmd" -BackButtonText "Go Back to Data Science" -ChildItems @(
    @{Name="5.2.1 ETL and ELT"; Link="5.2.1-etl-elt.qmd"},
    @{Name="5.2.2 Data Warehousing"; Link="5.2.2-data-warehousing.qmd"},
    @{Name="5.2.3 Data Lakes"; Link="5.2.3-data-lakes.qmd"},
    @{Name="5.2.4 Data Pipelines"; Link="5.2.4-data-pipelines.qmd"}
)
New-QuartoPage -Path "5.2.1-etl-elt.qmd" -Title "5.2.1 ETL and ELT" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Engineering"
New-QuartoPage -Path "5.2.2-data-warehousing.qmd" -Title "5.2.2 Data Warehousing" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Engineering"
New-QuartoPage -Path "5.2.3-data-lakes.qmd" -Title "5.2.3 Data Lakes" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Engineering"
New-QuartoPage -Path "5.2.4-data-pipelines.qmd" -Title "5.2.4 Data Pipelines" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Engineering"
Pop-Location
if (-not (Test-Path "5.3-big-data")) { New-Item -ItemType Directory -Name "5.3-big-data" | Out-Null }
Push-Location -Path "5.3-big-data"
New-QuartoPage -Path "index.qmd" -Title "5.3 Big Data" -ParentLink "../index.qmd" -BackButtonText "Go Back to Data Science" -ChildItems @(
    @{Name="5.3.1 Hadoop Ecosystem"; Link="5.3.1-hadoop.qmd"},
    @{Name="5.3.2 Apache Spark"; Link="5.3.2-spark.qmd"},
    @{Name="5.3.3 Data Streaming (Kafka)"; Link="5.3.3-kafka.qmd"}
)
New-QuartoPage -Path "5.3.1-hadoop.qmd" -Title "5.3.1 Hadoop Ecosystem" -ParentLink "index.qmd" -BackButtonText "Go Back to Big Data"
New-QuartoPage -Path "5.3.2-spark.qmd" -Title "5.3.2 Apache Spark" -ParentLink "index.qmd" -BackButtonText "Go Back to Big Data"
New-QuartoPage -Path "5.3.3-kafka.qmd" -Title "5.3.3 Data Streaming (Kafka)" -ParentLink "index.qmd" -BackButtonText "Go Back to Big Data"
Pop-Location
if (-not (Test-Path "5.4-data-visualization")) { New-Item -ItemType Directory -Name "5.4-data-visualization" | Out-Null }
Push-Location -Path "5.4-data-visualization"
New-QuartoPage -Path "index.qmd" -Title "5.4 Data Visualization" -ParentLink "../index.qmd" -BackButtonText "Go Back to Data Science" -ChildItems @(
    @{Name="5.4.1 Matplotlib/Seaborn"; Link="5.4.1-matplotlib-seaborn.qmd"},
    @{Name="5.4.2 D3.js"; Link="5.4.2-d3.qmd"},
    @{Name="5.4.3 Tableau/Power BI"; Link="5.4.3-tableau-powerbi.qmd"}
)
New-QuartoPage -Path "5.4.1-matplotlib-seaborn.qmd" -Title "5.4.1 Matplotlib/Seaborn" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Visualization"
New-QuartoPage -Path "5.4.2-d3.qmd" -Title "5.4.2 D3.js" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Visualization"
New-QuartoPage -Path "5.4.3-tableau-powerbi.qmd" -Title "5.4.3 Tableau/Power BI" -ParentLink "index.qmd" -BackButtonText "Go Back to Data Visualization"
Pop-Location
if (-not (Test-Path "5.5-business-intelligence")) { New-Item -ItemType Directory -Name "5.5-business-intelligence" | Out-Null }
Push-Location -Path "5.5-business-intelligence"
New-QuartoPage -Path "index.qmd" -Title "5.5 Business Intelligence (BI)" -ParentLink "../index.qmd" -BackButtonText "Go Back to Data Science" -ChildItems @(
    @{Name="5.5.1 BI Tools and Reports"; Link="5.5.1-bi-tools.qmd"},
    @{Name="5.5.2 Dashboards and KPIs"; Link="5.5.2-dashboards-kpis.qmd"}
)
New-QuartoPage -Path "5.5.1-bi-tools.qmd" -Title "5.5.1 BI Tools and Reports" -ParentLink "index.qmd" -BackButtonText "Go Back to Business Intelligence"
New-QuartoPage -Path "5.5.2-dashboards-kpis.qmd" -Title "5.5.2 Dashboards and KPIs" -ParentLink "index.qmd" -BackButtonText "Go Back to Business Intelligence"
Pop-Location
Pop-Location

# --- Módulo 6 ---
Pop-Location
if (-not (Test-Path "6.-cloud-computing-devops")) { New-Item -ItemType Directory -Name "6.-cloud-computing-devops" | Out-Null }
Push-Location -Path "6.-cloud-computing-devops"
New-QuartoPage -Path "index.qmd" -Title "6. Cloud Computing and DevOps" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="6.1 Cloud Fundamentals"; Link="6.1-cloud-fundamentals/index.qmd"},
    @{Name="6.2 DevOps Practices"; Link="6.2-devops-practices/index.qmd"},
    @{Name="6.3 Containerization"; Link="6.3-containerization/index.qmd"},
    @{Name="6.4 Serverless Computing"; Link="6.4-serverless-computing/index.qmd"},
    @{Name="6.5 Infrastructure as Code (IaC)"; Link="6.5-iac/index.qmd"}
)
if (-not (Test-Path "6.1-cloud-fundamentals")) { New-Item -ItemType Directory -Name "6.1-cloud-fundamentals" | Out-Null }
Push-Location -Path "6.1-cloud-fundamentals"
New-QuartoPage -Path "index.qmd" -Title "6.1 Cloud Fundamentals" -ParentLink "../index.qmd" -BackButtonText "Go Back to Cloud and DevOps" -ChildItems @(
    @{Name="6.1.1 IaaS, PaaS, SaaS"; Link="6.1.1-iaas-paas-saas.qmd"},
    @{Name="6.1.2 Cloud Providers (AWS, Azure, GCP)"; Link="6.1.2-cloud-providers.qmd"},
    @{Name="6.1.3 Cloud Security"; Link="6.1.3-cloud-security.qmd"}
)
New-QuartoPage -Path "6.1.1-iaas-paas-saas.qmd" -Title "6.1.1 IaaS, PaaS, SaaS" -ParentLink "index.qmd" -BackButtonText "Go Back to Cloud Fundamentals"
New-QuartoPage -Path "6.1.2-cloud-providers.qmd" -Title "6.1.2 Cloud Providers" -ParentLink "index.qmd" -BackButtonText "Go Back to Cloud Fundamentals"
New-QuartoPage -Path "6.1.3-cloud-security.qmd" -Title "6.1.3 Cloud Security" -ParentLink "index.qmd" -BackButtonText "Go Back to Cloud Fundamentals"
Pop-Location
if (-not (Test-Path "6.2-devops-practices")) { New-Item -ItemType Directory -Name "6.2-devops-practices" | Out-Null }
Push-Location -Path "6.2-devops-practices"
New-QuartoPage -Path "index.qmd" -Title "6.2 DevOps Practices" -ParentLink "../index.qmd" -BackButtonText "Go Back to Cloud and DevOps" -ChildItems @(
    @{Name="6.2.1 CI/CD (Continuous Integration/Deployment)"; Link="6.2.1-cicd.qmd"},
    @{Name="6.2.2 Monitoring and Logging"; Link="6.2.2-monitoring-logging.qmd"}
)
New-QuartoPage -Path "6.2.1-cicd.qmd" -Title "6.2.1 CI/CD" -ParentLink "index.qmd" -BackButtonText "Go Back to DevOps Practices"
New-QuartoPage -Path "6.2.2-monitoring-logging.qmd" -Title "6.2.2 Monitoring and Logging" -ParentLink "index.qmd" -BackButtonText "Go Back to DevOps Practices"
Pop-Location
if (-not (Test-Path "6.3-containerization")) { New-Item -ItemType Directory -Name "6.3-containerization" | Out-Null }
Push-Location -Path "6.3-containerization"
New-QuartoPage -Path "index.qmd" -Title "6.3 Containerization" -ParentLink "../index.qmd" -BackButtonText "Go Back to Cloud and DevOps" -ChildItems @(
    @{Name="6.3.1 Docker"; Link="6.3.1-docker.qmd"},
    @{Name="6.3.2 Kubernetes"; Link="6.3.2-kubernetes.qmd"}
)
New-QuartoPage -Path "6.3.1-docker.qmd" -Title "6.3.1 Docker" -ParentLink "index.qmd" -BackButtonText "Go Back to Containerization"
New-QuartoPage -Path "6.3.2-kubernetes.qmd" -Title "6.3.2 Kubernetes" -ParentLink "index.qmd" -BackButtonText "Go Back to Containerization"
Pop-Location
if (-not (Test-Path "6.4-serverless-computing")) { New-Item -ItemType Directory -Name "6.4-serverless-computing" | Out-Null }
Push-Location -Path "6.4-serverless-computing"
New-QuartoPage -Path "index.qmd" -Title "6.4 Serverless Computing" -ParentLink "../index.qmd" -BackButtonText "Go Back to Cloud and DevOps" -ChildItems @(
    @{Name="6.4.1 AWS Lambda"; Link="6.4.1-aws-lambda.qmd"},
    @{Name="6.4.2 Azure Functions"; Link="6.4.2-azure-functions.qmd"}
)
New-QuartoPage -Path "6.4.1-aws-lambda.qmd" -Title "6.4.1 AWS Lambda" -ParentLink "index.qmd" -BackButtonText "Go Back to Serverless Computing"
New-QuartoPage -Path "6.4.2-azure-functions.qmd" -Title "6.4.2 Azure Functions" -ParentLink "index.qmd" -BackButtonText "Go Back to Serverless Computing"
Pop-Location
if (-not (Test-Path "6.5-iac")) { New-Item -ItemType Directory -Name "6.5-iac" | Out-Null }
Push-Location -Path "6.5-iac"
New-QuartoPage -Path "index.qmd" -Title "6.5 Infrastructure as Code (IaC)" -ParentLink "../index.qmd" -BackButtonText "Go Back to Cloud and DevOps" -ChildItems @(
    @{Name="6.5.1 Terraform"; Link="6.5.1-terraform.qmd"},
    @{Name="6.5.2 Ansible"; Link="6.5.2-ansible.qmd"}
)
New-QuartoPage -Path "6.5.1-terraform.qmd" -Title "6.5.1 Terraform" -ParentLink "index.qmd" -BackButtonText "Go Back to IaC"
New-QuartoPage -Path "6.5.2-ansible.qmd" -Title "6.5.2 Ansible" -ParentLink "index.qmd" -BackButtonText "Go Back to IaC"
Pop-Location
Pop-Location

# --- Módulo 7 ---
Pop-Location
if (-not (Test-Path "7.-automation-low-code")) { New-Item -ItemType Directory -Name "7.-automation-low-code" | Out-Null }
Push-Location -Path "7.-automation-low-code"
New-QuartoPage -Path "index.qmd" -Title "7. Automation and Low-Code/No-Code" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="7.1 Process Automation (RPA)"; Link="7.1-rpa.qmd"},
    @{Name="7.2 Low-Code Platforms"; Link="7.2-low-code-platforms/index.qmd"},
    @{Name="7.3 No-Code Platforms"; Link="7.3-no-code-platforms/index.qmd"}
)
New-QuartoPage -Path "7.1-rpa.qmd" -Title "7.1 Process Automation (RPA)" -ParentLink "index.qmd" -BackButtonText "Go Back to Automation"
if (-not (Test-Path "7.2-low-code-platforms")) { New-Item -ItemType Directory -Name "7.2-low-code-platforms" | Out-Null }
Push-Location -Path "7.2-low-code-platforms"
New-QuartoPage -Path "index.qmd" -Title "7.2 Low-Code Platforms" -ParentLink "../index.qmd" -BackButtonText "Go Back to Automation" -ChildItems @(
    @{Name="7.2.1 Power Apps"; Link="7.2.1-power-apps.qmd"},
    @{Name="7.2.2 Mendix"; Link="7.2.2-mendix.qmd"}
)
New-QuartoPage -Path "7.2.1-power-apps.qmd" -Title "7.2.1 Power Apps" -ParentLink "index.qmd" -BackButtonText "Go Back to Low-Code"
New-QuartoPage -Path "7.2.2-mendix.qmd" -Title "7.2.2 Mendix" -ParentLink "index.qmd" -BackButtonText "Go Back to Low-Code"
Pop-Location
if (-not (Test-Path "7.3-no-code-platforms")) { New-Item -ItemType Directory -Name "7.3-no-code-platforms" | Out-Null }
Push-Location -Path "7.3-no-code-platforms"
New-QuartoPage -Path "index.qmd" -Title "7.3 No-Code Platforms" -ParentLink "../index.qmd" -BackButtonText "Go Back to Automation" -ChildItems @(
    @{Name="7.3.1 Webflow"; Link="7.3.1-webflow.qmd"},
    @{Name="7.3.2 Bubble"; Link="7.3.2-bubble.qmd"}
)
New-QuartoPage -Path "7.3.1-webflow.qmd" -Title "7.3.1 Webflow" -ParentLink "index.qmd" -BackButtonText "Go Back to No-Code"
New-QuartoPage -Path "7.3.2-bubble.qmd" -Title "7.3.2 Bubble" -ParentLink "index.qmd" -BackButtonText "Go Back to No-Code"
Pop-Location
Pop-Location

# --- Módulo 8 ---
Pop-Location
if (-not (Test-Path "8.-innovation-emerging-trends")) { New-Item -ItemType Directory -Name "8.-innovation-emerging-trends" | Out-Null }
Push-Location -Path "8.-innovation-emerging-trends"
New-QuartoPage -Path "index.qmd" -Title "8. Innovation and Emerging Trends" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="8.1 Cybersecurity"; Link="8.1-cybersecurity/index.qmd"},
    @{Name="8.2 Quantum Computing"; Link="8.2-quantum-computing.qmd"},
    @{Name="8.3 Blockchain and Web3"; Link="8.3-blockchain-web3/index.qmd"},
    @{Name="8.4 IoT (Internet of Things)"; Link="8.4-iot/index.qmd"}
)
if (-not (Test-Path "8.1-cybersecurity")) { New-Item -ItemType Directory -Name "8.1-cybersecurity" | Out-Null }
Push-Location -Path "8.1-cybersecurity"
New-QuartoPage -Path "index.qmd" -Title "8.1 Cybersecurity" -ParentLink "../index.qmd" -BackButtonText "Go Back to Innovation" -ChildItems @(
    @{Name="8.1.1 Ethical Hacking"; Link="8.1.1-ethical-hacking.qmd"},
    @{Name="8.1.2 Network Security"; Link="8.1.2-network-security.qmd"}
)
New-QuartoPage -Path "8.1.1-ethical-hacking.qmd" -Title "8.1.1 Ethical Hacking" -ParentLink "index.qmd" -BackButtonText "Go Back to Cybersecurity"
New-QuartoPage -Path "8.1.2-network-security.qmd" -Title "8.1.2 Network Security" -ParentLink "index.qmd" -BackButtonText "Go Back to Cybersecurity"
Pop-Location
New-QuartoPage -Path "8.2-quantum-computing.qmd" -Title "8.2 Quantum Computing" -ParentLink "../index.qmd" -BackButtonText "Go Back to Innovation"
if (-not (Test-Path "8.3-blockchain-web3")) { New-Item -ItemType Directory -Name "8.3-blockchain-web3" | Out-Null }
Push-Location -Path "8.3-blockchain-web3"
New-QuartoPage -Path "index.qmd" -Title "8.3 Blockchain and Web3" -ParentLink "../index.qmd" -BackButtonText "Go Back to Innovation" -ChildItems @(
    @{Name="8.3.1 Smart Contracts"; Link="8.3.1-smart-contracts.qmd"},
    @{Name="8.3.2 Cryptocurrencies"; Link="8.3.2-cryptocurrencies.qmd"}
)
New-QuartoPage -Path "8.3.1-smart-contracts.qmd" -Title "8.3.1 Smart Contracts" -ParentLink "index.qmd" -BackButtonText "Go Back to Blockchain and Web3"
New-QuartoPage -Path "8.3.2-cryptocurrencies.qmd" -Title "8.3.2 Cryptocurrencies" -ParentLink "index.qmd" -BackButtonText "Go Back to Blockchain and Web3"
Pop-Location
if (-not (Test-Path "8.4-iot")) { New-Item -ItemType Directory -Name "8.4-iot" | Out-Null }
Push-Location -Path "8.4-iot"
New-QuartoPage -Path "index.qmd" -Title "8.4 IoT (Internet of Things)" -ParentLink "../index.qmd" -BackButtonText "Go Back to Innovation" -ChildItems @(
    @{Name="8.4.1 Embedded Systems"; Link="8.4.1-embedded-systems.qmd"},
    @{Name="8.4.2 Wireless Communication"; Link="8.4.2-wireless-communication.qmd"}
)
New-QuartoPage -Path "8.4.1-embedded-systems.qmd" -Title "8.4.1 Embedded Systems" -ParentLink "index.qmd" -BackButtonText "Go Back to IoT"
New-QuartoPage -Path "8.4.2-wireless-communication.qmd" -Title "8.4.2 Wireless Communication" -ParentLink "index.qmd" -BackButtonText "Go Back to IoT"
Pop-Location
Pop-Location

# --- Módulo 9 ---
Pop-Location
if (-not (Test-Path "9.-business-applications-management")) { New-Item -ItemType Directory -Name "9.-business-applications-management" | Out-Null }
Push-Location -Path "9.-business-applications-management"
New-QuartoPage -Path "index.qmd" -Title "9. Business Applications and Management" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="9.1 Project Management"; Link="9.1-project-management.qmd"},
    @{Name="9.2 Digital Marketing"; Link="9.2-digital-marketing.qmd"},
    @{Name="9.3 E-commerce"; Link="9.3-e-commerce.qmd"},
    @{Name="9.4 ERP and CRM Systems"; Link="9.4-erp-crm.qmd"}
)
New-QuartoPage -Path "9.1-project-management.qmd" -Title "9.1 Project Management" -ParentLink "index.qmd" -BackButtonText "Go Back to Business Applications"
New-QuartoPage -Path "9.2-digital-marketing.qmd" -Title "9.2 Digital Marketing" -ParentLink "index.qmd" -BackButtonText "Go Back to Business Applications"
New-QuartoPage -Path "9.3-e-commerce.qmd" -Title "9.3 E-commerce" -ParentLink "index.qmd" -BackButtonText "Go Back to Business Applications"
New-QuartoPage -Path "9.4-erp-crm.qmd" -Title "9.4 ERP and CRM Systems" -ParentLink "index.qmd" -BackButtonText "Go Back to Business Applications"
Pop-Location

# --- Módulo 10 ---
Pop-Location
if (-not (Test-Path "10.-research-academic-publications")) { New-Item -ItemType Directory -Name "10.-research-academic-publications" | Out-Null }
Push-Location -Path "10.-research-academic-publications"
New-QuartoPage -Path "index.qmd" -Title "10. Research and Academic Publications" -ParentLink "../../index.qmd" -BackButtonText "Go Back to Home" -ChildItems @(
    @{Name="10.1 Thesis and Dissertations"; Link="10.1-thesis-dissertations.qmd"},
    @{Name="10.2 Scientific Articles"; Link="10.2-scientific-articles.qmd"},
    @{Name="10.3 Literature Review"; Link="10.3-literature-review.qmd"}
)
New-QuartoPage -Path "10.1-thesis-dissertations.qmd" -Title "10.1 Thesis and Dissertations" -ParentLink "index.qmd" -BackButtonText "Go Back to Research"
New-QuartoPage -Path "10.2-scientific-articles.qmd" -Title "10.2 Scientific Articles" -ParentLink "index.qmd" -BackButtonText "Go Back to Research"
New-QuartoPage -Path "10.3-literature-review.qmd" -Title "10.3 Literature Review" -ParentLink "index.qmd" -BackButtonText "Go Back to Research"
Pop-Location

# Vuelve a la carpeta raíz 'PlanetSTEAM'
Pop-Location