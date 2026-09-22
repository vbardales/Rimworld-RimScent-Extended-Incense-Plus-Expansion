[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
function Assert-True([bool]$condition, [string]$message) { if (-not $condition) { throw $message } }
function Read-Xml([string]$path) { [xml](Get-Content -Raw (Join-Path $root $path)) }

$xmlFiles = Get-ChildItem (Join-Path $root 'Mod') -Recurse -File -Filter '*.xml'
foreach ($file in $xmlFiles) { [xml](Get-Content -Raw $file.FullName) | Out-Null }

$thoughts = @{}
$thoughtDoc = Read-Xml 'Mod/Defs/Aromas_Thoughts.xml'
foreach ($thought in @($thoughtDoc.Defs.ThoughtDef | Where-Object { $_.defName })) { $thoughts[$thought.defName] = [string]$thought.stages.li.baseMoodEffect }
$expectedMood = [ordered]@{
    RimScentExtended_Scent_Sandalwood = '4'; RimScentExtended_Scent_Frankincense = '2'
    RimScentExtended_Scent_Psychoid = '2'; RimScentExtended_Scent_Smokeleaf = '5'
    RimScentExtended_Scent_Berry = '2'; RimScentExtended_Scent_Cocoa = '3'
}
Assert-True ((@($thoughts.Keys | Sort-Object) -join ',') -eq (@($expectedMood.Keys | Sort-Object) -join ',')) 'Owned scent thought inventory changed.'
foreach ($name in $expectedMood.Keys) { Assert-True ($thoughts[$name] -eq $expectedMood[$name]) "Unexpected mood effect for $name." }

$items = Read-Xml 'Mod/Defs/Aromas_Items.xml'
$buildings = Read-Xml 'Mod/Defs/Aromas_Buildings.xml'
$recipes = Read-Xml 'Mod/Defs/Aromas_Recipes.xml'
$hediffs = Read-Xml 'Mod/Defs/Aromas_Hediffs.xml'
foreach ($aroma in @('Sandalwood', 'Frankincense', 'Psychoid', 'Smokeleaf', 'Berry', 'Cocoa')) {
    $item = "RimScentExtended_Incense_$aroma"; $burner = "RimScentExtended_Burner_$aroma"; $recipe = "RimScentExtended_Make_$aroma"; $hediff = "RimScentExtended_Aroma_$aroma"
    Assert-True ((@($items.Defs.ThingDef | Where-Object defName -eq $item).Count -eq 1)) "Missing incense item: $item."
    Assert-True ((@($recipes.Defs.RecipeDef | Where-Object defName -eq $recipe).Count -eq 1)) "Missing aroma recipe: $recipe."
    Assert-True ((@($buildings.Defs.ThingDef | Where-Object defName -eq $burner).Count -eq 1)) "Missing aroma burner: $burner."
    Assert-True ((@($hediffs.Defs.HediffDef | Where-Object defName -eq $hediff).Count -eq 1)) "Missing aroma Hediff: $hediff."
}

$about = Read-Xml 'Mod/About/About.xml'
$deps = @($about.ModMetaData.modDependencies.li.packageId)
foreach ($id in @('reo.RimScent', 'ocarina.rimscent.incense', 'nelim.rimscent.extended')) { Assert-True ($deps -contains $id) "Missing hard dependency: $id." }
Assert-True ($deps.Count -eq 3) 'Optional integrations must not become hard dependencies.'
Assert-True ([string]$about.ModMetaData.name -eq 'RimScent Extended: Incense Plus Expansion (unofficial)') 'Public-silent title marking changed.'
Assert-True ($about.ModMetaData.description.TrimEnd().EndsWith('[url=https://github.com/vbardales/Rimworld-RimScent-Extended-Incense-Plus-Expansion]Source code on GitHub[/url]')) 'Workshop source link must end the description.'

$fr = @{}
foreach ($file in $xmlFiles | Where-Object { $_.FullName -match '[\\/]Languages[\\/]French[\\/]' }) {
    [xml]$doc = Get-Content -Raw $file.FullName
    foreach ($node in @($doc.LanguageData.ChildNodes | Where-Object NodeType -eq Element)) { Assert-True (-not $fr.ContainsKey($node.Name)) "Duplicate French key: $($node.Name)."; Assert-True (-not [string]::IsNullOrWhiteSpace($node.InnerText)) "Empty French key: $($node.Name)."; $fr[$node.Name] = $true }
}
Assert-True ($fr.Count -eq 89) 'French DefInjected inventory changed.'

Add-Type -AssemblyName System.Drawing
foreach ($spec in @(@{ Name='ModIcon'; Width=128; Height=128; MaxBytes=30720 }, @{ Name='Preview'; Width=896; Height=504; MaxBytes=1MB })) {
    $file = Get-Item (Join-Path $root "Mod/About/$($spec.Name).png"); $image = [System.Drawing.Image]::FromFile($file.FullName)
    try { Assert-True ($image.Width -eq $spec.Width -and $image.Height -eq $spec.Height) "$($spec.Name) dimensions changed."; Assert-True ($file.Length -lt $spec.MaxBytes) "$($spec.Name) exceeds its size limit." } finally { $image.Dispose() }
}
Write-Host "PASS: $($xmlFiles.Count) XML files, $($expectedMood.Count) aromas, and $($fr.Count) French entries validated."
