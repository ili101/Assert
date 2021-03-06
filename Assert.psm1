﻿Import-Module $PSScriptRoot/TypeClass/src/TypeClass.psm1 -DisableNameChecking
Import-Module $PSScriptRoot/Format/src/Format.psm1 -DisableNameChecking

. $PSScriptRoot/Compatibility/src/Compatibility.ps1

Get-ChildItem -Path $PSScriptRoot/src/ -Recurse -Filter *.ps1 |
    ForEach-Object { . $_.FullName }

Export-ModuleMember -Function @(
    'Get-EquivalencyOption'
    'Assert-Equivalent'
    'Assert-Equal' # ?= ' ?eq
    'Assert-NotEqual' # ?!= ?ne
    'Assert-Same' # ?=== ?ref ?same
    'Assert-NotSame' # ?!=== ?notref ?notsame
    'Assert-Null' # ?0  ?null
    'Assert-NotNull' # ?!0  ?notnull
    'Assert-Type' # ?type ?is
    'Assert-NotType' # ?nottype ?isnot
    'Assert-LessThan' # ?< ?lt
    'Assert-LessThanOrEqual' # ?<= ?le
    'Assert-GreaterThan' # ?> ?gt
    'Assert-GreaterThanOrEqual' # ?>= ?ge'
    'Assert-True' # ?true
    'Assert-False' # ?false
    'Assert-Contain' # ?contain
    'Assert-NotContain' #?notcontain
    'Assert-Any' # ?any
    'Assert-All' # ?all
    'Assert-Throw'
    'Assert-Like'
    'Assert-NotLike'
    'Assert-StringEqual'
    'Assert-StringNotEqual'
)