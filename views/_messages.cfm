<cfoutput>
  <cfloop collection="#flash()#" item="flashKey">
    <p class="#LCase(flashKey)# bg">#flash(flashKey)#</p>
  </cfloop>
</cfoutput>
