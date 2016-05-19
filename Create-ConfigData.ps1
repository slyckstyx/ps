$DomainComputers = Get-ADComputer -Filter * -Properties Name, ObjectGUID, Description
$ConfigData.AllNodes = @(@{NodeName='*';AllNodesProperty='AllNodesTestValue'})
$DomainComputers | % { $ConfigData.AllNodes += @( @{ NodeName=$_.Name;ConfigurationID=$_.ObjectGUID;NodeType=$_.Description } ) }