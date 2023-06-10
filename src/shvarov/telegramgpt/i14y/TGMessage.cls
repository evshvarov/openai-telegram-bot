Class shvarov.telegramgpt.i14y.TGMessage Extends Telegram.Request
{

Property ChatId As %String;

Property Text As %VarString;

Method %OnNew(data As %DynamicAbstractObject) As %Status
{
    Set ..Data = $G(data)
    if '$IsObject(..Data) {
        Return $$$OK
    }
    set ..ChatId=..Data.message.chat.id
    set ..Text=..Data.message.text
    set ..Method="sendMessage"
    Return $$$OK
}

ClassMethod JSONForTelegramData(chatid, text As %String) As %String
{
    Set res={
            "chat_id": (chatid),
            "text": (text)
        }
    // do something
    Return res
}

Storage Default
{
<Data name="TGMessageDefaultData">
<Subscript>"TGMessage"</Subscript>
<Value name="1">
<Value>ChatId</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
</Data>
<DefaultData>TGMessageDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
