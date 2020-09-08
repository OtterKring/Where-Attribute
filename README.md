# PS_Where-Attribute

find attributes matching a certain value

## Why?

I often find myself knowing the value I have to look for, but not the name of the attribute.

## Example

An employee marries and changes his/her name. Now find all attributes of the mailbox where the old name is still present:

`Get-Mailbox -Filter 'Name -like "newname*"' | Where-Attribute -like "*oldname*"`
