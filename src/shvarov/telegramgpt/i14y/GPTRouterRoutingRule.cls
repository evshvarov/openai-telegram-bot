/// 
Class shvarov.telegramgpt.i14y.GPTRouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="shvarov.telegramgpt.i14y.TgGptProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<when condition="1" comment="">
<send transform="shvarov.telegramgpt.i14y.GPT2Tg" target="Telegram.BusinessOperation"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
