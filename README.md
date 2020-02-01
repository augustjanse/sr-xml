# sr-xml
Instructions to produce an RSS file for SR programs with more than 500 episodes

## Introduction
SR has many good programs. They host RSS files for them, but these files only contain the 500 latest episodes. This means you can't listen to older episodes in your podcast player.

In order to do so, I threw together an XSL sheet that can produce an RSS feed containing more than 500 episodes. I am documenting this so I remember the next time I need to do this.

## Steps to use
1. Locate your program on `sr.se`.

```
https://sverigesradio.se/humornip3
```

2. Click "Om...". The programid will appear in the URL.

```
https://sverigesradio.se/sida/artikel.aspx?programid=3389&artikel=2597737
```

3. Click "Poddradio(xml)" and save the file as `rss.xml`.

4. In the following URL, replace the programid (`3389`) with your program's programid. Save the file as `episodes.xml`.

```
http://api.sr.se/v2/episodes/index?programid=3389&pagination=false
```

5. Download the file `pod.xsl` from this repo. From `rss.xml`, copy everything from `<itunes:new-feed-url>` until `</copyright>`. Copy it into `pod.xsl`, replacing the comment close to the beginning of the file.

6. Change the links in `<itunes:new-feed-url>`, `<atom:link>` and `<link>` tags you just pasted. Change the title in multiple `<title>` tags. For example, add a `2` to all of them.

7. Add the following tag just before the `<sr>` tag in `episodes.xml`.

```
<?xml-stylesheet type="text/xsl" href="pod.xsl"?>
```

8. Run an XSTL processor on `episodes.xml` like following.

```
xsltproc episodes.xml -o new.xml  
```

9. Host `new.xml` on a publicly accessible server. Add it as a URL in your podcast app.

## Limitations
This is a very makeshift solution written sloppily to be used once. Then I used it twice. A lot of it could be automated in the XSL, but it's probably not worth it for me to do it just in case I'm going to use it thrice. You're welcome to send a pull request!

The resulting file misses some metadata, and actually contains some that is incorrect as well. However, I have found it to work. Also, I haven't really formatted the XSL file. That would probably be easy to do.

About step 5, this is what I found worked for Pocket Casts. If you don't to this, it automatically identifies it as the official feed. I guess most popular apps behave the same. A subset of the tags I edited would probably suffice, though.

