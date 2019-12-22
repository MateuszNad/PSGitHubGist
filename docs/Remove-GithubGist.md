---
external help file: PSGitHubGist-help.xml
Module Name: PSGitHubGist
online version:
schema: 2.0.0
---

# Remove-GithubGist

## SYNOPSIS
The function remove GitHub Gists

## SYNTAX

```
Remove-GithubGist [-UserName] <String> [-Token] <String> [-Id] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
All documentation find you on https://developer.github.com/v3/gists/#delete-a-gist

## EXAMPLES

### EXAMPLE 1
```
Remove-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Id 'bbc1363c779397143f9c5169dd22562a'
```

Delete a gist

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

### -Id
{{ Fill Id Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: GistId

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
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
