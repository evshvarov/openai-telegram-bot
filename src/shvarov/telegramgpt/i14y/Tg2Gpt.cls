Class shvarov.telegramgpt.i14y.Tg2Gpt Extends Ens.DataTransformDTL [ DependsOn = (Telegram.JSONContainer, St.OpenAi.Msg.Chat.ChatRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Telegram.JSONContainer' targetClass='St.OpenAi.Msg.Chat.ChatRequest' create='new' language='objectscript' >
<assign value='"gpt-3.5-turbo-0301"' property='target.Model' action='set' />
<assign value='"user"' property='target.Messages.(1).Role' action='set' />
<assign value='source.Data.message.text' property='target.Messages.(1).Content' action='set' />
</transform>
}

}
