# Quarto Twitter embedding extions

A [Quarto](https://quarto.org) extension to embed tweets into an html document using a shortcode.

## Installation

Install the extension with:

``` bash
quarto install extension sellorm/quarto-twitter-embed
```

## Usage

To embed a video into your Quarto html document you can use the shortcode like this:

```
{{< tweet user="USERNAME" id="STATUS_ID" >}}
```

For example:

```
{{< tweet user="sellorm" id="1555267341327503367" >}}
```

You can obtain the username and status id of a tweet by clicking the "share tweet" button and choosing "copy URL".

This will give you a URL like this one: `https://twitter.com/sellorm/status/1555267341327503367?s=21&t=M0M4IA_KW-zMY1rb2XOWZQ`. The "user" is the section between `twitter.com/` and `/status`. The status "id" is everything between `status/` and `?` or the end of the URL, whichever comes first.

See `example.qmd` for a full example.
