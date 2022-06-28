<cfscript>
// Use this file to set variables for the Application.cfc's "this" scope.

// Examples:
// this.name = "MyAppName";
// this.sessionTimeout = CreateTimeSpan(0,0,5,0);

this.datasources['example'] = {
  class: 'org.h2.Driver'
, connectionString: 'jdbc:h2:file:#GetDirectoryFromPath(GetBaseTemplatePath())#db/h2/example;MODE=MySQL'
, username = 'sa'
};
</cfscript>
