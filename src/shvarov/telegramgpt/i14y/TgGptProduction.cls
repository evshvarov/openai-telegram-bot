Class shvarov.telegramgpt.i14y.TgGptProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="shvarov.telegramgpt.i14y.TgGptProduction" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Telegram.InboundService" Category="" ClassName="shvarov.telegramgpt.i14y.TGInService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">tg</Setting>
    <Setting Target="Adapter" Name="Token"></Setting>
    <Setting Target="Host" Name="Target">GPTRouter</Setting>
  </Item>
  <Item Name="GPTRouter" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">shvarov.telegramgpt.i14y.TGRouterRoutingRule</Setting>
    <Setting Target="Host" Name="ResponseFrom">St.OpenAi.BO.Api.Connect</Setting>
    <Setting Target="Host" Name="ResponseTargetConfigNames">TGRouter</Setting>
  </Item>
  <Item Name="Telegram.OutboundOperation" Category="" ClassName="Telegram.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">tg</Setting>
    <Setting Target="Adapter" Name="Token"></Setting>
  </Item>
  <Item Name="St.OpenAi.BO.Api.Connect" Category="" ClassName="St.OpenAi.BO.Api.Connect" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ApiKey"></Setting>
    <Setting Target="Host" Name="Organization"></Setting>
    <Setting Target="Adapter" Name="SSLConfig">tg</Setting>
  </Item>
  <Item Name="TGRouter" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">shvarov.telegramgpt.i14y.GPTRouterRoutingRule</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
    <Setting Target="Host" Name="AlertOnBadMessage">1</Setting>
  </Item>
</Production>
}

}
