/// 
Class shvarov.telegramgpt.i14y.TGRouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="shvarov.telegramgpt.i14y.TgGptProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="source" value=""></constraint>
<when condition="1" comment="">
<send transform="shvarov.telegramgpt.i14y.Tg2Gpt" target="St.OpenAi.BO.Api.Connect"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
