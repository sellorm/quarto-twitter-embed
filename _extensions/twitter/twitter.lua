local function ensureHtmlDeps()
    quarto.doc.addHtmlDependency({
        name = 'twitter',
        version = '0.0.1',
        scripts = {
            { 
                path = "",
                attribs = {src="https://platform.twitter.com/widgets.js"},
                afterBody = true
            }
        }
    })
end

function tweet(args, kwargs)
    if quarto.doc.isFormat('html') then
        ensureHtmlDeps()
        local user = pandoc.utils.stringify(args[1])
        local status_id = pandoc.utils.stringify(args[2])
        
        -- Assemble the twitter oembed API URL from the user inputs
        local tweet_embed = 'https://publish.twitter.com/oembed?url=https://twitter.com/' 
            .. user
            .. '/status/'
            .. status_id
            .. '&align=center'
        
        local mt, api_resp = pandoc.mediabag.fetch(tweet_embed)
        
        -- generate a random number to append to the html div ID to avoid re-use
        local id = math.random(10000, 99999)

        local tweet_data = '<div id="tweet-'
            .. id 
            .. '"></div><script>tweet=' 
            .. api_resp 
            .. ';document.getElementById("tweet-' 
            .. id 
            .. '").innerHTML = tweet["html"];</script>'

        return pandoc.RawInline('html', tweet_data)
    else
        return pandoc.Null()
    end
end
