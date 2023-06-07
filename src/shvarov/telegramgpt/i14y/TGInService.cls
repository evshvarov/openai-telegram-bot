Class shvarov.telegramgpt.i14y.TGInService Extends Ens.BusinessService
{

Parameter ADAPTER = "Telegram.InboundAdapter";

Property Target;

Parameter SETTINGS = "Target:TelegramDemo:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    If (..Target = "") {
        Return $$$ERROR(5001, "Target property required")
    }
    Set msg = ##class(shvarov.telegramgpt.i14y.TGMessage).%New(pInput)
    Return ..SendRequestAsync(..Target, msg)
}

}
