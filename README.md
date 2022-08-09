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
{{< tweet TWEET_URL >}}
```

Where `TWEET_URL` is the URL of the tweet you want to embed. For example:

```
{{< tweet https://twitter.com/sellorm/status/1555267341327503367 >}}
```

You can obtain the tweet URL by clicking the "share tweet" button and choosing "copy URL".

This will give you a URL like this one: `https://twitter.com/sellorm/status/1555267341327503367?s=21&t=M0M4IA_KW-zMY1rb2XOWZQ`. Everything before the `?` is required.

See `example.qmd` for a full example.

