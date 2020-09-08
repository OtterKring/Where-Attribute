<#
.SYNOPSIS
Find attributes matching a given value

.DESCRIPTION
Find all attributes of an object which match a certain value.
Supported comparisons: -eq, -ne, -like, -notlike, -match, -notmatch

.PARAMETER InputObject
Object to search in

PIPELINE enabled
MANDATORY

.PARAMETER eq
-eq Operator, Parameter value use used for comparison

.PARAMETER ne
-ne Operator, Parameter value use used for comparison

.PARAMETER like
-like Operator, Parameter value use used for comparison

.PARAMETER notlike
-notlike Operator, Parameter value use used for comparison

.PARAMETER match
-match Operator, Parameter value use used for comparison

.PARAMETER notmatch
-notmatch Operator, Parameter value use used for comparison

.EXAMPLE
Get-ADUser einstein | Where-AttributeValue -like "*albert*"

.NOTES
Version 1.0, 2020-09-03
    Initial Version

Maximilian Otter, 2020-09-03
Twitter: @Otterkring
#>

function Where-AttributeValue {

    param (
        [Parameter(Mandatory,Position=0,ValueFromPipeline)]
        [psobject]$InputObject,
        [string]
        $eq, $ne, $like, $notlike, $match, $notmatch #, $contains, $notcontains, $in, $notin
    )

    begin {

        $Operator = $PSBoundParameters.Keys | Where-Object { process { $_ -ne 'InputObject'} }
        $FilterString = [string]::Concat(" -$Operator ","'$((Get-Variable -Name $Operator).Value)'")

    }

    process {

        $InputObject.PSObject.Properties.Where{ & ( [scriptblock]::Create( [string]::Concat("'",$_.Value,"'",$FilterString) ) ) } `
        | Select-Object Name,Value

    }

    end {
        # nothing yet
    }

}