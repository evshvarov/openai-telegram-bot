 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/iris-interoperability-template)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-interoperability-template)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-interoperability-template)
# telegram-gpt
This is an IRIS Interoperability Production that enables Telegram Bot to talk to ChatGPT
## Prerequisits

Create a bot using @BotFather account and get the Bot Token. Then add bot into a telegram chat or channel and give it admin rights.
Learn more at https://core.telegram.org/bots/api

Open (create if you don't have it) an account on https://platform.openai.com/ and get your [Open AI API Key](https://platform.openai.com/account/api-keys) and [Organization id](https://platform.openai.com/account/org-settings).

Make sure you have IPM installed in your InterSystems IRIS. if not here is one liner to install:
```
USER>    s r=##class(%Net.HttpRequest).%New(),r.Server="pm.community.intersystems.com",r.SSLConfiguration="ISC.FeatureTracker.SSL.Config" d r.Get("/packages/zpm/latest/installer"),$system.OBJ.LoadStream(r.HttpResponse.Data,"c")


```

## Installation

Open IRIS Namespace with Interoperability Enabled.
Open Terminal and call:
```
USER>zpm "install telegram-gpt -D TgToken=your_telegram_token -D GPTKey=your_ChatGPT_key"
```
## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/evshvarov/openai-telegram-bot
```

Create .env file in the root directory of the repo with:

TG_BOT_TOKEN=Your_telegrambot_token
OPENAPI_KEY=Your_chatGPT_key


Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

4. Open Terminal and call:

```
USER>d ##class(shvarov.telegramgpt.Setup).Init($system.Util.GetEnviron("TG_BOT_TOKEN"),$system.Util.GetEnviron("OPENAPI_KEY"))
```

## How to Run the Service

Open the [production](http://localhost:52797/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=shvarov.telegramgpt.i14y.TgGptProduction).

Put your bot's Telegram Token into Telegram business service and Telegram Business operation both:
<img width="763" alt="Screenshot 2023-06-07 at 4 55 19 PM" src="https://github.com/evshvarov/openai-telegram-bot/assets/2781759/21459de3-0496-4f69-9374-2fc40518e5c3">


Also initialize St.OpenAi.BO.Api.Connect operation with your Chat GPT API key and Organisation id:
<img width="770" alt="Screenshot 2023-06-07 at 4 56 08 PM" src="https://github.com/evshvarov/openai-telegram-bot/assets/2781759/edae4e49-3b1b-49c4-9763-19901e9b490e">

Start the production

Ask any question in the telegram chat. You'll get an answer via Chat GPT.
Enjoy!

# Details
This example uses 3.5 version of Chat GPT Open AI. It could be altered in the [data-transformation rule](http://localhost:52797/csp/user/EnsPortal.DTLEditor.zen?DT=shvarov.telegptchat.i14y.Tg2Gpt.dtl) for the Model parameter.

## Credits

This application uses [Telegram-adapter](https://openexchange.intersystems.com/package/Telegram-adapter) by [Nikolay Soloviev](https://openexchange.intersystems.com/user/Nikolay%20Solovyev/PdgTNFsHyQu1qL02CS4BfFYIs) and [Iris-OpenAI](https://openexchange.intersystems.com/package/iris-openai) adapter by [Kurro Lopez](https://openexchange.intersystems.com/user/Francisco%20L%C3%B3pez/n8nIarmmcBVMySIjS3ukc2Mp9w).
Thank you both for making it easy to enable interoperability scenarios for OpenAI and Telegram!

