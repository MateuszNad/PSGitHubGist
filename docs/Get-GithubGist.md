---
external help file: PSGitHubGist-help.xml
Module Name: PSGitHubGist
online version:
schema: 2.0.0
---

# Get-GithubGist

## SYNOPSIS
The function list GitHub Gists

## SYNTAX

### Id (Default)
```
Get-GithubGist -UserName <String> -Token <String> [-Id <String>] [-PerPage <Int32>] [-Page <Int32>]
 [<CommonParameters>]
```

### Starred
```
Get-GithubGist -UserName <String> -Token <String> [-Starred] [-PerPage <Int32>] [-Page <Int32>]
 [<CommonParameters>]
```

### Public
```
Get-GithubGist -UserName <String> -Token <String> [-Public] [-PerPage <Int32>] [-Page <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
All documentation find you on https://developer.github.com/v3/gists/#list-a-users-gists

## EXAMPLES

### EXAMPLE 1
```
Get-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c'
```

List a user's gists.

### EXAMPLE 2
```
Get-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Id 'bbc1363c779397143f9c5169dd22562a'
```

Get a single gist

### EXAMPLE 3
```
Get-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Starred
```

List the authenticated user's starred gists

### EXAMPLE 4
```
Get-GithubGist  -UserName 'mnadobnik' -Token '4725a2b2c59ed7296699db3d6736f84802b4ea55' -Public
```

List all public gists sorted by most recently updated to least recently updated.

### EXAMPLE 5
```
Note: With pagination, you can fetch up to 3000 gists. For example, you can fetch 100 pages with 30 gists per page or 30 pages with 100 gists per page.
```

## PARAMETERS

### -UserName
{{ Fill UserName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
{{ Fill Id Description }}

```yaml
Type: String
Parameter Sets: Id
Aliases: GistId

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Starred
{{ Fill Starred Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Starred
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Public
{{ Fill Public Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Public
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PerPage
{{ Fill PerPage Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

### -Page
{{ Fill Page Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: True (ByValue)
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
