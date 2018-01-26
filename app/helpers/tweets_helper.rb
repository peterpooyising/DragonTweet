module TweetsHelper


  def tagify_tweet(tweet)
    tags = tweet.tags
    tagified_tweet = tweet.content
    tags.each do |tag|
      tagified_tweet.gsub!( /#{tag.name}\b/, link_to(tag.name, tweets_by_tag_path(tag), class: "tag") )
      # Need to use string interpolation #{} for REGEX
      # gsub! will permanently change the original tweet itself with whatever you chose to substitute with.
      # gsub(<what I want to find>, <what I want to replace with>)
      html = "".html_safe
      html << "<div class='tag'>".html_safe
      html << tag
      html << "</div>".html_safe
      html
    end
    tagified_tweet.html_safe
    # Visit https://makandracards.com/makandra/2579-everything-you-know-about-html_safe-is-wrong for more information on html.safe
  end

end
=begin

======================================================= html.safe ==========================================================
Rails renders your views into a SafeBuffer. It starts with an empty SafeBuffer and one by one appends the components of your views to it. This means that any <%= expression %> in your view template will be HTML-escaped, unless the expression returns a SafeBuffer, which does not need to be escaped.

Take the following ERB template:

    <p>
      <%= '<br />' %>
      <%= '<br />'.html_safe %>
    </p>

Somewhere inside of Rails, this ERB template will be converted into a Ruby expression like this:

    html = ''.html_safe
    html << '<p>'.html_safe
    html << '<br />'
    html << '<br />'.html_safe
    html << '</p>'.html_safe
    html

If we eval the expression above, we will get this result:

    <p>
      &lt;br /&gt;
      <br />
    </p>

====================================================== regex ============================================================
"#{tag.name}\b" will mark "#{tag.name}" that is a whole word by itself or directly after a word. (words are delimited by spaces) So in the tweet, we can find #tag when it is:
  sentence. #tag #tag2 #tag3
  sentence.#tag #tag2 #tag3

Word boundary is any character that is not a word character; so it can be a space, a dash etc. We use it as a form of delimiter. Note that: Numbers are considered words.

https://www.youtube.com/watch?v=dmERxT0-qU4

=end
