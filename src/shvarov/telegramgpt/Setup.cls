Class shvarov.telegramgpt.Setup
{

ClassMethod Init(TgToken As %String, GPTKey As %String) As %Status
{
    set st=$$$OK
    set production="shvarov.telegramgpt.i14y.TgGptProduction"

    for item="Telegram.InboundService","Telegram.OutboundOperation" {
        set st=##class(shvarov.i14y.Settings).SetValue(production,item,"Token",TgToken)
        quit:$$$ISERR(st)
    }
    set item="St.OpenAi.BO.Api.Connect"
    set st=##class(shvarov.i14y.Settings).SetValue(production,item,"ApiKey",GPTKey)
    return st
}

ClassMethod StartProduction()
{
    set prodClass = "shvarov.telegramgpt.i14y.TgGptProduction"
    do ##class(%EnsembleMgr).SetAutoStart($namespace, prodClass)
    job ##class(Ens.Director).StartProduction(prodClass)
}

}
