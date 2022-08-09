function tweet(args)
    local url = pandoc.utils.stringify(args[1])
    local tweet_embed = 'https://publish.twitter.com/oembed?url=' .. url .. '&align=center'
    local mt, api_resp = pandoc.mediabag.fetch(tweet_embed)
    local id = math.random(10000, 99999)
    local tweet_data = '<div id="tweet-' .. id .. '"></div><script>tweet=' .. api_resp .. ';document.getElementById("tweet-' .. id .. '").innerHTML = tweet["html"];</script>'
    if quarto.doc.isFormat('html') then
        quarto.doc.addHtmlDependency({
            name = "twitter",
            afterBody = true,
            scripts = {
    { path = "", attribs = {src="https://platform.twitter.com/widgets.js"}
}
}
  })
	return pandoc.RawInline('html', tweet_data)
    else
        return pandoc.Null()
    end
end
