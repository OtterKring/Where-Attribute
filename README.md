# Where-Attribute

find attributes matching a certain value

## Why?

I often find myself knowing the value I have to look for, but not the name of the attribute.

## Example

An employee marries and changes his/her lastname. Given that accountnames are formatted "Lastname Firstname", now find all attributes of the mailbox where the old name is still present:

`Get-Mailbox -Filter 'Name -like "newname*"' | Where-Attribute -like "*oldname*"`

## Direct coding

You could do it directly, too:

`(Get-Mailbox -Filter 'Name -like "newname*"').psobject.properties.where{$_.value -like "*oldname*"} | Select-Object name,value`

whatever you prefer :-)
