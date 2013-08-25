# Description:
#   Interacts with the JHU Hub API.
#
# Commands:
#   hubot hub me - Returns recent Hub articles for now.

module.exports = (robot) ->

  robot.respond /hub me/i, (msg) ->

    msg.reply "Hub? Ok on it brb";
    
    # msg.send typeof robot.http

    robot.http("http://api.hub.jhu.edu/articles?v=0&key=billcosby&per_page=3")
      .get() (err, res, body) -> 

        payload = JSON.parse(body);

        msg.send article.headline + ": " + article.url for article in payload._embedded.articles.reverse();

  # robot.respond /test test/i, (msg) ->

  #   msg.send "you tested it"
