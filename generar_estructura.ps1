# Script de Generación Automática del Curso de Dibujo para Niños
# Este script crea la estructura completa de directorios y archivos base

# Configuración
$cursoPath = "e:\repositories\teach-laoz-courses-generator\cursos\teach-laoz-curso-dibujo-ninos"

# Estructura curricular completa (basada en plan_curricular.md)
$estructura = @(
    @{
        modulo = 1
        titulo = "Fundamentos de Formas Básicas"
        temas = @(
            @{
                tema_id = "1.1"
                titulo = "El Mundo de las Formas Simples"
                subtemas = @(
                    @{ id = "1.1.1"; titulo = "Círculos perfectos (o casi)" },
                    @{ id = "1.1.2"; titulo = "Cuadrados y rectángulos" },
                    @{ id = "1.1.3"; titulo = "Triángulos de todos los tipos" }
                )
            },
            @{
                tema_id = "1.2"
                titulo = "Combinando Formas para Crear Objetos"
                subtemas = @(
                    @{ id = "1.2.1"; titulo = "Mi primera casa" },
                    @{ id = "1.2.2"; titulo = "Robots geométricos" },
                    @{ id = "1.2.3"; titulo = "Animales con formas simples" }
                )
            }
        )
    },
    @{
        modulo = 2
        titulo = "Control de Línea y Trazado"
        temas = @(
            @{
                tema_id = "2.1"
                titulo = "Líneas con Personalidad"
                subtemas = @(
                    @{ id = "2.1.1"; titulo = "Líneas gruesas y delgadas" },
                    @{ id = "2.1.2"; titulo = "Líneas suaves y líneas fuertes" },
                    @{ id = "2.1.3"; titulo = "Líneas que cuentan historias" }
                )
            },
            @{
                tema_id = "2.2"
                titulo = "Patrones y Texturas"
                subtemas = @(
                    @{ id = "2.2.1"; titulo = "Puntos, rayas y cuadrículas" },
                    @{ id = "2.2.2"; titulo = "Texturas de la naturaleza" }
                )
            }
        )
    },
    @{
        modulo = 3
        titulo = "Observación y Dibujo del Natural"
        temas = @(
            @{
                tema_id = "3.1"
                titulo = "Aprendiendo a Ver como Artistas"
                subtemas = @(
                    @{ id = "3.1.1"; titulo = "El juego de las diferencias" },
                    @{ id = "3.1.2"; titulo = "Dibujando mi juguete favorito" },
                    @{ id = "3.1.3"; titulo = "Frutas y verduras" }
                )
            },
            @{
                tema_id = "3.2"
                titulo = "Proporciones Básicas"
                subtemas = @(
                    @{ id = "3.2.1"; titulo = "Grande, mediano y pequeño" },
                    @{ id = "3.2.2"; titulo = "La regla del pulgar (medición visual)" }
                )
            }
        )
    },
    @{
        modulo = 4
        titulo = "Introducción al Color"
        temas = @(
            @{
                tema_id = "4.1"
                titulo = "El Círculo Cromático Mágico"
                subtemas = @(
                    @{ id = "4.1.1"; titulo = "Los tres colores mágicos (primarios)" },
                    @{ id = "4.1.2"; titulo = "Mezclando colores nuevos (secundarios)" },
                    @{ id = "4.1.3"; titulo = "Colores que se llevan bien (armonías)" }
                )
            },
            @{
                tema_id = "4.2"
                titulo = "Colores Cálidos y Fríos"
                subtemas = @(
                    @{ id = "4.2.1"; titulo = "El sol y el fuego (colores cálidos)" },
                    @{ id = "4.2.2"; titulo = "El mar y el cielo (colores fríos)" }
                )
            }
        )
    },
    @{
        modulo = 5
        titulo = "Luz, Sombra y Volumen"
        temas = @(
            @{
                tema_id = "5.1"
                titulo = "De lo Plano a lo Redondo"
                subtemas = @(
                    @{ id = "5.1.1"; titulo = "¿De dónde viene la luz?" },
                    @{ id = "5.1.2"; titulo = "Sombreando una esfera" },
                    @{ id = "5.1.3"; titulo = "Sombras proyectadas" }
                )
            },
            @{
                tema_id = "5.2"
                titulo = "Técnicas de Sombreado"
                subtemas = @(
                    @{ id = "5.2.1"; titulo = "Sombreado con líneas (rayado)" },
                    @{ id = "5.2.2"; titulo = "Sombreado difuminado" }
                )
            }
        )
    },
    @{
        modulo = 6
        titulo = "Composición y Diseño"
        temas = @(
            @{
                tema_id = "6.1"
                titulo = "El Espacio del Papel"
                subtemas = @(
                    @{ id = "6.1.1"; titulo = "Arriba, abajo, centro" },
                    @{ id = "6.1.2"; titulo = "Primer plano y fondo" }
                )
            },
            @{
                tema_id = "6.2"
                titulo = "Equilibrio Visual"
                subtemas = @(
                    @{ id = "6.2.1"; titulo = "Simetría y asimetría" },
                    @{ id = "6.2.2"; titulo = "El punto focal (¿dónde miran primero?)" }
                )
            }
        )
    },
    @{
        modulo = 7
        titulo = "Perspectiva Básica"
        temas = @(
            @{
                tema_id = "7.1"
                titulo = "Cosas Cerca y Cosas Lejos"
                subtemas = @(
                    @{ id = "7.1.1"; titulo = "El camino que se hace chiquito" },
                    @{ id = "7.1.2"; titulo = "Casas en la distancia" }
                )
            },
            @{
                tema_id = "7.2"
                titulo = "La Línea del Horizonte"
                subtemas = @(
                    @{ id = "7.2.1"; titulo = "Cielo y tierra" },
                    @{ id = "7.2.2"; titulo = "Perspectiva de un punto (la calle)" }
                )
            }
        )
    },
    @{
        modulo = 8
        titulo = "Figura Humana Simplificada"
        temas = @(
            @{
                tema_id = "8.1"
                titulo = "El Muñeco de Palitos Evolucionado"
                subtemas = @(
                    @{ id = "8.1.1"; titulo = "Cabeza, tronco y extremidades" },
                    @{ id = "8.1.2"; titulo = "Poses y movimiento" }
                )
            },
            @{
                tema_id = "8.2"
                titulo = "Rostros Expresivos"
                subtemas = @(
                    @{ id = "8.2.1"; titulo = "Feliz, triste, enojado, sorprendido" },
                    @{ id = "8.2.2"; titulo = "Mi autorretrato" }
                )
            }
        )
    },
    @{
        modulo = 9
        titulo = "Animales y Naturaleza"
        temas = @(
            @{
                tema_id = "9.1"
                titulo = "Animales Favoritos"
                subtemas = @(
                    @{ id = "9.1.1"; titulo = "Mascotas (perro, gato, conejo)" },
                    @{ id = "9.1.2"; titulo = "Animales salvajes (león, elefante, jirafa)" }
                )
            },
            @{
                tema_id = "9.2"
                titulo = "Paisajes Naturales"
                subtemas = @(
                    @{ id = "9.2.1"; titulo = "Árboles de diferentes tipos" },
                    @{ id = "9.2.2"; titulo = "Mi paisaje imaginario" }
                )
            }
        )
    },
    @{
        modulo = 10
        titulo = "Imaginación y Creatividad Avanzada"
        temas = @(
            @{
                tema_id = "10.1"
                titulo = "Criaturas Fantásticas"
                subtemas = @(
                    @{ id = "10.1.1"; titulo = "Mi dragón único" },
                    @{ id = "10.1.2"; titulo = "Híbridos imposibles" }
                )
            },
            @{
                tema_id = "10.2"
                titulo = "Mundos Inventados"
                subtemas = @(
                    @{ id = "10.2.1"; titulo = "Mi planeta extraño" },
                    @{ id = "10.2.2"; titulo = "La ciudad del futuro" }
                )
            }
        )
    },
    @{
        modulo = 11
        titulo = "Técnicas Mixtas y Experimentación"
        temas = @(
            @{
                tema_id = "11.1"
                titulo = "Más Allá del Lápiz"
                subtemas = @(
                    @{ id = "11.1.1"; titulo = "Acuarelas y crayones juntos" },
                    @{ id = "11.1.2"; titulo = "Collage y dibujo" }
                )
            },
            @{
                tema_id = "11.2"
                titulo = "Texturas Reales"
                subtemas = @(
                    @{ id = "11.2.1"; titulo = "Frotado de texturas" },
                    @{ id = "11.2.2"; titulo = "Arena, tela y otros materiales" }
                )
            }
        )
    },
    @{
        modulo = 12
        titulo = "Proyecto Personal Final"
        temas = @(
            @{
                tema_id = "12.1"
                titulo = "Planificación del Proyecto"
                subtemas = @(
                    @{ id = "12.1.1"; titulo = "Eligiendo mi tema favorito" },
                    @{ id = "12.1.2"; titulo = "Bocetos y pruebas" }
                )
            },
            @{
                tema_id = "12.2"
                titulo = "Ejecución y Presentación"
                subtemas = @(
                    @{ id = "12.2.1"; titulo = "Creando mi obra maestra" },
                    @{ id = "12.2.2"; titulo = "Presentando mi trabajo" }
                )
            }
        )
    }
)

Write-Host "=== GENERADOR AUTOMÁTICO DE ESTRUCTURA DEL CURSO ===" -ForegroundColor Cyan
Write-Host ""

# Crear directorios para cada módulo
foreach ($mod in $estructura) {
    $moduloDir = Join-Path $cursoPath "modulos\modulo_$($mod.modulo)"
    
    if (-not (Test-Path $moduloDir)) {
        New-Item -ItemType Directory -Path $moduloDir -Force | Out-Null
        Write-Host "✓ Creado: modulo_$($mod.modulo)" -ForegroundColor Green
    }
    
    # Crear archivos para cada subtema
    foreach ($tema in $mod.temas) {
        foreach ($subtema in $tema.subtemas) {
            $baseNombre = "tema_$($subtema.id)"
            
            # Crear archivo de contenido
            $contenidoPath = Join-Path $moduloDir "$($baseNombre)_contenido.md"
            if (-not (Test-Path $contenidoPath)) {
                $contenidoTemplate = @"
# $($subtema.titulo)

**Tiempo estimado**: 20-30 minutos  
**Nivel**: Progresivo (6+ años)  
**Prerrequisitos**: Temas anteriores del módulo

---

## ¿Por qué importa este concepto?

[Este contenido será expandido en la fase de producción detallada]

**Objetivo de aprendizaje**: $($subtema.titulo)

---

## Comprensión intuitiva

[Explicación accesible del concepto]

---

## Práctica guiada

### Ejercicio 1: [Nombre del ejercicio]

**Materiales**: Lápiz, papel

**Instrucciones**:
1. [Paso 1]
2. [Paso 2]
3. [Paso 3]

---

## Resumen

**En una frase**: [Resumen del concepto]

**Siguiente paso**: [Enlace al siguiente subtema]

---

*Nota: Este es un contenido base. Será expandido con ejemplos detallados, actividades prácticas y recursos visuales.*
"@
                Set-Content -Path $contenidoPath -Value $contenidoTemplate -Encoding UTF8
            }
            
            # Crear archivo de ejercicios
            $ejerciciosPath = Join-Path $moduloDir "$($baseNombre)_ejercicios.md"
            if (-not (Test-Path $ejerciciosPath)) {
                $ejerciciosTemplate = @"
# Ejercicios: $($subtema.titulo)

## Ejercicio 1: Práctica Básica

**Nivel**: Principiante  
**Tiempo**: 10 minutos

### Instrucciones
[Instrucciones detalladas]

### Criterios de éxito
- [ ] Criterio 1
- [ ] Criterio 2

---

## Ejercicio 2: Desafío Intermedio

**Nivel**: Intermedio  
**Tiempo**: 15 minutos

### Instrucciones
[Instrucciones detalladas]

---

## Ejercicio 3: Proyecto Creativo

**Nivel**: Avanzado  
**Tiempo**: 20 minutos

### Instrucciones
[Instrucciones detalladas]

---

*Nota: Los ejercicios serán expandidos con rúbricas detalladas y ejemplos visuales.*
"@
                Set-Content -Path $ejerciciosPath -Value $ejerciciosTemplate -Encoding UTF8
            }
            
            # Crear archivo de guión
            $guionPath = Join-Path $moduloDir "$($baseNombre)_guion.md"
            if (-not (Test-Path $guionPath)) {
                $guionTemplate = @"
# Guión de Audio/Video: $($subtema.titulo)

## Introducción (30 segundos)

¡Hola, pequeño artista! Hoy vamos a aprender sobre **$($subtema.titulo)**.

---

## Desarrollo (2-3 minutos)

[Contenido principal del guión]

---

## Cierre (30 segundos)

¡Excelente trabajo! Ahora sabes cómo [resumen del aprendizaje].

---

*Nota: Este guión será expandido con timing detallado y notas de producción.*
"@
                Set-Content -Path $guionPath -Value $guionTemplate -Encoding UTF8
            }
            
            # Crear archivo de evaluación
            $evaluacionPath = Join-Path $moduloDir "$($baseNombre)_evaluacion.md"
            if (-not (Test-Path $evaluacionPath)) {
                $evaluacionTemplate = @"
# Evaluación: $($subtema.titulo)

## Pregunta 1

**Tipo**: Opción múltiple

**Pregunta**: [Pregunta sobre el concepto]

a) Opción A  
b) Opción B  
c) Opción C  
d) Opción D

**Respuesta correcta**: [Letra]  
**Explicación**: [Por qué es correcta]

---

## Pregunta 2

**Tipo**: Práctica

**Instrucción**: [Tarea práctica para demostrar comprensión]

**Criterios de evaluación**:
- [ ] Criterio 1
- [ ] Criterio 2

---

*Nota: La evaluación será expandida con más preguntas y rúbricas detalladas.*
"@
                Set-Content -Path $evaluacionPath -Value $evaluacionTemplate -Encoding UTF8
            }
        }
    }
}

Write-Host ""
Write-Host "=== RESUMEN DE GENERACIÓN ===" -ForegroundColor Cyan
Write-Host "Módulos creados: $($estructura.Count)" -ForegroundColor Yellow
$totalSubtemas = ($estructura | ForEach-Object { $_.temas | ForEach-Object { $_.subtemas.Count } } | Measure-Object -Sum).Sum
Write-Host "Subtemas totales: $totalSubtemas" -ForegroundColor Yellow
Write-Host "Archivos generados: $($totalSubtemas * 4) (contenido + ejercicios + guión + evaluación)" -ForegroundColor Yellow
Write-Host ""
Write-Host "✓ Estructura base del curso generada exitosamente" -ForegroundColor Green
