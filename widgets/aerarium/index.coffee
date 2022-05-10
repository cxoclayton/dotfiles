
#mode of widget (light)
command: "curl -s --location --request GET 'https://yesra.local/api/v1/cli/stats' --header 'Accept: application/json' --header 'Authorization: Bearer WODB1WDKXOCu98O8UekedYfwAZCkCOInxMH6WE7V'"
refreshFrequency: '5m'

#=== DO NOT EDIT AFTER THIS LINE unless you know what you're doing! ===
#======================================================================

render: (output) -> """
  <div id='years'></div>
  <div id='aerarium'></div>
  <div id='accts'></div>
"""

update: (output) ->
    data = JSON.parse(output)
    stats = data.months
    ystats = data.years
    accounts = data.accounts
    inner = '<table>'
    totalYear = 0;
    months=['Umm', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
    for i in [0...stats.length]
        dc = (parseFloat(stats[i].s) ) > 0
        if dc
            dclass='pos'
        else
            dclass='neg'
        totalYear += stats[i].s
        
        inner += """
            <tr>
                <td class='year'>#{stats[i].posted_at_y}</td>
                <td class='month'>#{months[stats[i].posted_at_m]}</td>
                <td class='currency #{dclass}'>#{Math.abs(stats[i].s).toLocaleString('us-en',{minimumFractionDigits: 2 })}</td>
            </tr>
        """


    if totalYear > 0
        tclass = 'pos'
    else
        tclass='neg'
    inner+="""
        <tr>
            <td colspan=2 class="year">Total</td>
            <td class='#{tclass} currency'>#{(totalYear).toLocaleString("us-en",{minimumFractionDigits:0  })}</td>
        </tr>
    """
    inner+="</table>"

    yearlySumTotal = 0;
    outer = "<table>"
    for i in [0...ystats.length]
        yearlySumTotal += ystats[i].s
        if ystats[i].s > 0
            dc = 'pos'
        else   
            dc = 'neg'
        outer += """
            <tr>
                <td class='year'>#{ystats[i].posted_at_y}</td>
                <td class='#{dc} currency'>#{(Math.abs(ystats[i].s)).toLocaleString('us-en',{minimumFractionDigits: 2 })}</td>
            </tr>
        """
    
    if yearlySumTotal > 0
        yclass='pos'
    else
        yclass='neg'

    outer += """
        <tr>
        <td class="year">Total</td>
        <td class='#{yclass} currency'>#{(yearlySumTotal).toLocaleString('us-en',{minimumFractionDigits: 2 })}</td>
        </tr>
    """
    outer += "</table>"

    
    
    acctTable = "<table>"
    for k,acct of accounts
        if acct.show > 0
            lastDt = new Date(acct.last_balance_at)
            acctTable += """
                <tr>
                    <td class="acctname"><span style="{color: #{acct.foreground}}">#{acct.name}</span></td>
                    <td class='acctbal currency'>#{Math.abs(acct.last_balance).toLocaleString('us-en', {minimumFractionDigits:2})}</td>
                    <td class='acctdt'>#{(lastDt.getMonth()+1 + "").padStart(2,'0')}/#{(lastDt.getDate() + "").padStart(2,'0')}/#{lastDt.getFullYear()}</td>            </tr>
            """
    acctTable += "</table>"

    $(aerarium).html(inner)
    $(years).html(outer)
    $(accts).html(acctTable)

style: """
    fgcolor=#AAA
    negcolor=#ff0000

    top: 1000px
    right: 10px;
    color: fgcolor;
    background-color: rgba(0,0,0,.25)
    font-size: 12pt
    font-family: Courier;
    padding-top: 10px; 
    padding-left: 10px;
    padding-bottom: 10px;
    #years {
        float: left;        
    }

    #aerarium {
        float: right; 
        margin: 0px 15px;
    }

    #accts {
        clear: both;
        float: left;
        margin 10px 0px;
        border-top: solid 1px fgcolor
        padding-top: 5px;
    }

    table {
     //   border: solid 1px #000;
    }

    td.year {
        text-align: left;
        padding-right: 2ex;
    }

    td.month {
        padding-right: 1ex;
    }

    td.neg {
        color: negcolor
        text-align: right;
    }

    td.pos {
        text-align:right;
    }

    td.acctbal {
        text-align: right;
    }

    td.currency:before {
        content: "$";
        float: left;
        padding-right: 2ex;
    }
    td.acctname {
        padding-right: 2ex;
    }

    td.acctdt {
        color: #444;
    }
"""
