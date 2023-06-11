Class shvarov.telegramgpt.Setup
{

ClassMethod Init(TgToken As %String, GPTKey As %String) As %Status
{
    set st=$$$OK
    set production = ##class(Ens.Config.Production).%OpenId("shvarov.telegramgpt.i14y.TgGptProduction")
    quit:'$IsObject(production) $$$ERROR($$$GeneralError,"Production not found")
    #dim item As Ens.Config.Item
    #dim sett As Ens.Config.Setting

    if $g(TgToken)'="" {
        for i=1:1:production.Items.Count() {
        s item=production.Items.GetAt(i)
        ;w !,item.Name
        if item.Name="Telegram.InboundService"
        ||(item.Name="Telegram.OutboundOperation")
            {
            for s=1:1:item.Settings.Count() {
                set sett=item.Settings.GetAt(s)
                ;w !,sett.Name
                if sett.Name="Token" set sett.Value=TgToken
                }
            }
        }
        $$$ThrowOnError(production.%Save())
        }

    if $g(GPTKey)'="" {
        for i=1:1:production.Items.Count() {
        s item=production.Items.GetAt(i)
        ;w !,item.Name
        if item.Name="St.OpenAi.BO.Api.Connect"
            {
            for s=1:1:item.Settings.Count() {
                set sett=item.Settings.GetAt(s)
                ;w !,sett.Name
                if sett.Name="ApiKey" set sett.Value=GPTKey
                }
            }
        }
        $$$ThrowOnError(production.%Save())
    }
    return st
}

ClassMethod StartProduction()
{
    set prodClass = "shvarov.telegramgpt.i14y.TgGptProduction"
    do ##class(%EnsembleMgr).SetAutoStart($namespace, prodClass)
    job ##class(Ens.Director).StartProduction(prodClass)
}

}

