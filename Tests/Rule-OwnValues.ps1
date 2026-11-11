# What only this mod asserts: the six aromas (thought mood values, item/burner/recipe/hediff inventory),
# the three hard dependencies, the unofficial title and the Workshop source link that ends the description.
# Generic checks (XML well formed, defNames, translation coverage, image sizes) are the shared scripts', run by Test-Mod.ps1.
# Takes -ModRoot (repository root) and -SharedDir (unused, kept for the Test-Mod.ps1 contract); prints findings, exits 1 on any.
param([string]$ModRoot = (Join-Path $PSScriptRoot '..'), [string]$SharedDir)
$ErrorActionPreference = 'Stop'
$ModRoot = (Resolve-Path -LiteralPath $ModRoot).Path
$script:findings = New-Object System.Collections.Generic.List[string]
function Assert-True($Condition, [string]$Message) { if (-not $Condition) { $script:findings.Add("FAIL: $Message") } }
function Read-Xml([string]$path) { [xml](Get-Content -Raw (Join-Path $ModRoot $path)) }

$thoughts = @{}
foreach ($thought in @((Read-Xml 'Mod/Defs/Aromas_Thoughts.xml').Defs.ThoughtDef | Where-Object { $_.defName })) { $thoughts[$thought.defName] = [string]$thought.stages.li.baseMoodEffect }
$expectedMood = [ordered]@{
    RimScentExtended_Scent_Sandalwood = '4'; RimScentExtended_Scent_Frankincense = '2'
    RimScentExtended_Scent_Psychoid = '2'; RimScentExtended_Scent_Smokeleaf = '5'
    RimScentExtended_Scent_Berry = '2'; RimScentExtended_Scent_Cocoa = '3'
}
Assert-True ((@($thoughts.Keys | Sort-Object) -join ',') -eq (@($expectedMood.Keys | Sort-Object) -join ',')) 'Owned scent thought inventory'
foreach ($name in $expectedMood.Keys) { Assert-True ($thoughts[$name] -eq $expectedMood[$name]) "Mood effect of $name" }

$items = Read-Xml 'Mod/Defs/Aromas_Items.xml'
$buildings = Read-Xml 'Mod/Defs/Aromas_Buildings.xml'
$recipes = Read-Xml 'Mod/Defs/Aromas_Recipes.xml'
$hediffs = Read-Xml 'Mod/Defs/Aromas_Hediffs.xml'
foreach ($aroma in @('Sandalwood', 'Frankincense', 'Psychoid', 'Smokeleaf', 'Berry', 'Cocoa')) {
    Assert-True (@($items.Defs.ThingDef | Where-Object defName -eq "RimScentExtended_Incense_$aroma").Count -eq 1) "Incense item $aroma"
    Assert-True (@($recipes.Defs.RecipeDef | Where-Object defName -eq "RimScentExtended_Make_$aroma").Count -eq 1) "Aroma recipe $aroma"
    Assert-True (@($buildings.Defs.ThingDef | Where-Object defName -eq "RimScentExtended_Burner_$aroma").Count -eq 1) "Aroma burner $aroma"
    Assert-True (@($hediffs.Defs.HediffDef | Where-Object defName -eq "RimScentExtended_Aroma_$aroma").Count -eq 1) "Aroma hediff $aroma"
}

$about = Read-Xml 'Mod/About/About.xml'
$deps = @($about.ModMetaData.modDependencies.li.packageId)
foreach ($id in @('reo.RimScent', 'ocarina.rimscent.incense', 'nelim.rimscent.extended')) { Assert-True ($deps -contains $id) "Hard dependency $id" }
Assert-True ($deps.Count -eq 3) 'Optional integrations must not become hard dependencies'
Assert-True ([string]$about.ModMetaData.name -ceq 'RimScent Extended: Incense Plus Expansion (unofficial)') 'Public-silent title marking'
Assert-True ($about.ModMetaData.description.TrimEnd().EndsWith('[url=https://github.com/vbardales/Rimworld-RimScent-Extended-Incense-Plus-Expansion]Source code on GitHub[/url]')) 'Workshop source link ends the description'

if ($script:findings.Count -gt 0) { $script:findings | ForEach-Object { Write-Host $_ }; exit 1 }
Write-Host "PASS: $($expectedMood.Count) aromas, dependencies and About identity"
