---
external help file: PSGitHubGist-help.xml
Module Name: PSGitHubGist
online version:
schema: 2.0.0
---

# New-GithubGist

## SYNOPSIS
The function create new GitHub Gists

## SYNTAX

```
New-GithubGist [-UserName] <String> [-Token] <String> [-Path] <String> [[-Name] <Object>]
 [[-Description] <Object>] [-Private] [<CommonParameters>]
```

## DESCRIPTION
All documentation find you on https://developer.github.com/v3/gists/#create-a-gist

## EXAMPLES

### EXAMPLE 1
```
New-GithubGist -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Path .\Format-SQLCode.ps1
```

### EXAMPLE 2
```

```

## PARAMETERS

### -UserName
{{ Fill UserName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
{{ Fill Token Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
{{ Fill Path Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
{{ Fill Name Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
{{ Fill Description Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Private
{{ Fill Private Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Mateusz Nadobnik
Link: akademiapowershell.pl

Date: 02-12-2019
Version: version
eywords: keywords
Notes:
Changelog:

## RELATED LINKS
