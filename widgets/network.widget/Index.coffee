#--------------------------------------------------------------------------------------
# Please Read
#--------------------------------------------------------------------------------------
# The images used in this widget are from the Noun Project (http://thenounproject.com).
#
# They were created by the following individuals:
#   Ethernet by Michael Anthony from The Noun Project
#   Wireless by Piotrek Chuchla from The Noun Project
#
#--------------------------------------------------------------------------------------

# Execute the shell command.
command: "network.widget/getNetworkInfo.sh"

# Set the refresh frequency (milliseconds).
refreshFrequency: 5000

# Render the output.
render: (output) -> """
  <table id='services'></table>
"""

# Update the rendered output.
update: (output, domEl) -> 
  dom = $(domEl)
  
  # Parse the JSON created by the shell script.
  data = JSON.parse output
  
  html = "<tr><td>"+ data.hostname + "</td><td colspan=2 class='ral'>" + data.pubip + "</td></tr>"
  # Loop through the services in the JSON.
  for svc in data.service
  
    # Start building our table cell.
    html += "<tr>" 
    
    # If there is an IP Address, we should show the connected icon. Otherwise we show the disable icon.
    # If there is no IP Address, we show "Not Connected" rather than the missing IP Address.
    if svc.ipaddress == ''
      html += "  <td><img class='icon' src='network.widget/images/" + svc.name + "_disabled.png'/></td>"
      html += "  <td>" + svc.macaddress + "</td>"
      html += "  <td class='ral'>>Not Connected</td>" 
    else
      html += "  <td><img class='icon' src='network.widget/images/" + svc.name + ".png'/></td>"
      if svc.name == 'wi-fi'
        html += "  <td  class='ral'>" + data.ssid  + "(" + data.txrate + " Mbps)</td>"
      else
        html += "  <td>" + svc.macaddress + "</td>"
      html += "  <td>" + svc.ipaddress + "</td>" 
    
    # Show the Mac Address.
    
    html += "</tr>"
  
  # Set our output.
  $(services).html(html)

# CSS Style
style: """
  margin:0
  padding:0px
  left:10px
  top: 261px
  background:rgba(#FFF, .1)
  border-radius:5px
  font-family: Helvetica Neue
  color: #fff
  font-size:10pt   
  
  .icon
    height:24px
    width:24px
    
  .ral
    padding:0px
    padding-right: 4px
    margin:4px
    text-align:right
"""
