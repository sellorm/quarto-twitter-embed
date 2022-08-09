function tweet(args, kwargs)
    local user = pandoc.utils.stringify(kwargs["user"])
    local status_id = pandoc.utils.stringify(kwargs["id"])
    local tweet_embed = 'https://publish.twitter.com/oembed?url=https://twitter.com/' .. user .. '/status/' .. status_id .. '&align=center'
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
