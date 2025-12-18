# Script de Generación de Contenido Optimizado para Classroom
# Consolida subtemas en archivos de Tema únicos

$cursoPath = "e:\repositories\teach-laoz-courses-generator\cursos\teach-laoz-curso-dibujo-ninos"
$modulosPath = Join-Path $cursoPath "modulos"
$classroomPath = Join-Path $cursoPath "classroom"

# Función para limpiar el contenido markdown
function Format-Content {
    param (
        [string]$content,
        [string]$type
    )
    
    $lines = $content -split "`r`n" | Where-Object { 
        $_ -notmatch "^Requiere Código:" -and 
        $_ -notmatch "^Tipo:" -and
        $_ -notmatch "^Marca de tiempo:" 
    }
    
    $processedLines = $lines | ForEach-Object {
        if ($_ -match "^# ") { return "## $($_.Substring(2))" }
        if ($_ -match "^## ") { return "### $($_.Substring(3))" }
        if ($_ -match "^### ") { return "#### $($_.Substring(4))" }
        return $_
    }
    
    return ($processedLines -join "`r`n")
}

if (-not (Test-Path $classroomPath)) {
    New-Item -ItemType Directory -Path $classroomPath -Force | Out-Null
    Write-Host "Directorio 'classroom' creado." -ForegroundColor Green
}

$modulos = Get-ChildItem $modulosPath -Directory | Sort-Object { [int]($_.Name -replace "modulo_", "") }

foreach ($modulo in $modulos) {
    $moduloName = $modulo.Name
    $moduloNum = $moduloName -replace "modulo_", ""
    
    Write-Host "Procesando $moduloName..." -ForegroundColor Cyan
    
    $destModuloPath = Join-Path $classroomPath "Modulo_$moduloNum"
    if (-not (Test-Path $destModuloPath)) {
        New-Item -ItemType Directory -Path $destModuloPath -Force | Out-Null
    }
    
    $files = Get-ChildItem $modulo.FullName
    
    # Agrupar por Tema (ej. tema_1.1)
    # Patrón: tema_X.Y...
    $temasGroups = $files | Where-Object { $_.Name -match "^tema_(\d+\.\d+)" } | Group-Object { 
        if ($_.Name -match "^tema_(\d+\.\d+)") { $matches[1] } 
    } | Sort-Object { [version]$_.Name }
    
    foreach ($group in $temasGroups) {
        $temaId = $group.Name
        
        Write-Host "  Generando documento para Tema $temaId..." -NoNewline
        
        $finalContent = @()
        $finalContent += "# Tema $($temaId): Consolidado"
        $finalContent += ""
        $finalContent += "> Este documento contiene todo el material didáctico para el Tema $temaId."
        $finalContent += ""
        $finalContent += "---"
        $finalContent += ""
        
        # Subtemas
        $subtemas = $group.Group | Where-Object { $_.Name -match "tema_(\d+\.\d+\.\d+)_" } | 
        Group-Object { if ($_.Name -match "tema_(\d+\.\d+\.\d+)_") { $matches[1] } } | 
        Sort-Object { [version]$_.Name }
        
        foreach ($subtema in $subtemas) {
            $subId = $subtema.Name
            
            # Contenido
            $contFile = $subtema.Group | Where-Object { $_.Name -like "*_contenido.md" }
            if ($contFile) {
                # Get-Content raw
                $raw = Get-Content $contFile.FullName -Raw -Encoding UTF8
                if ($raw -match "^# (.+)") {
                    $tituloSubtema = $matches[1]
                    $finalContent += "# Subtema $($subId): $tituloSubtema"
                }
                else {
                    $finalContent += "# Subtema $subId"
                }
                $finalContent += ""
                $finalContent += "## 📖 Contenido Teórico"
                $finalContent += ""
                $finalContent += Format-Content -content $raw -type 'contenido'
                $finalContent += ""
            }
            
            # Ejercicios
            $ejerFile = $subtema.Group | Where-Object { $_.Name -like "*_ejercicios.md" }
            if ($ejerFile) {
                $raw = Get-Content $ejerFile.FullName -Raw -Encoding UTF8
                $finalContent += ""
                $finalContent += "## ✏️ Ejercicios Prácticos"
                $finalContent += ""
                $finalContent += Format-Content -content $raw -type 'ejercicios'
                $finalContent += ""
            }
            
            # Evaluacion
            $evalFile = $subtema.Group | Where-Object { $_.Name -like "*_evaluacion.md" }
            if ($evalFile) {
                $raw = Get-Content $evalFile.FullName -Raw -Encoding UTF8
                $finalContent += ""
                $finalContent += "## 🧠 Evaluación Rapida"
                $finalContent += ""
                $finalContent += Format-Content -content $raw -type 'evaluacion'
                $finalContent += ""
            }
            
            $finalContent += "---"
            $finalContent += ""
        }
        
        $outFile = Join-Path $destModuloPath "Tema_$($temaId)_Completo.md"
        $finalContent | Set-Content -Path $outFile -Encoding UTF8
        Write-Host " OK" -ForegroundColor Green
    }
}
Write-Host "Generación completada." -ForegroundColor Green
