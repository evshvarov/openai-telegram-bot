Class shvarov.telegramgpt.i14y.Tg2Tg Extends Ens.DataTransformDTL [ DependsOn = shvarov.telegramgpt.i14y.TGMessage ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='shvarov.telegramgpt.i14y.TGMessage' targetClass='shvarov.telegramgpt.i14y.TGMessage' create='new' language='objectscript' >
<assign value='source.Method' property='target.Method' action='set' />
<assign value='source.ChatId' property='target.ChatId' action='set' />
<assign value='source.Text' property='target.Text' action='set' />
<assign value='##class(shvarov.telegramgpt.i14y.TGMessage).JSONForTelegramData(source.ChatId,source.Text)' property='target.Data' action='set' />
</transform>
}

}
