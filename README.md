# Casper

## Introduction

casper is a transparent proxy designed to be used during a web application
penetration test during a manual target link discovery step.

Instead of just fireup a crawler, with casper you can have the link visited
during a normal user session.

This is ideal to understand the logic sequence steps and what's happening
behind the woods.

## Usage

Running casper it is very easy:

```
$ casper 

[2012-06-27 08:52:47] INFO  WEBrick 1.3.1
[2012-06-27 08:52:47] INFO  ruby 1.9.3 (2012-04-20) [x86_64-darwin11.4.0]
[2012-06-27 08:52:47] INFO  Casper::Proxy#start: pid=24323 port=8080
``` 

Now you can configure your browser to use http://localhost:8080 as proxy server
and watching all requests reaching the target.

If you don't want to be bothered by too much noise on screen, you can ask
casper only to trace requests for the url you're interested to:

```
$ casper -T theapptotest.com
``` 

## Talking to the proxy server

casper is configured to handle some signals and react accordingly:

* SIGINT: shutdown the server 
* SIGINFO: the server will put an informational string about how many requests were collected and how many unique hosts were discovered
* SIGUSR1: the server will dump all the hosts you're browser communicated with
* SIGUSR2: the server will dump all logged urls
