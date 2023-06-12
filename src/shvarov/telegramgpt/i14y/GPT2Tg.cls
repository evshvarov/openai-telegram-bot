Class shvarov.telegramgpt.i14y.GPT2Tg Extends Ens.DataTransformDTL [ DependsOn = (St.OpenAi.Msg.Chat.ChatResponse, Telegram.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

ClassMethod GetChatId() As %String
{
    set sessionId = $get($$$JobSessionId)

    &sql(SELECT MessageBodyId into :msgId From Ens.MessageHeader
        WHERE SessionId=:sessionId
       )
    return ##class(Telegram.JSONContainer).%OpenId(msgId).Data.message.chat.id
}

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='St.OpenAi.Msg.Chat.ChatResponse' targetClass='Telegram.Request' create='new' language='objectscript' >
<assign value='"sendMessage"' property='target.Method' action='set' />
<assign value='{}' property='target.Data' action='set' />
<assign value='..GetChatId()' property='target.Data."chat_id"' action='set' />
<assign value='source.Choices.(1).Message.Content' property='target.Data.text' action='set' />
</transform>
}

}
