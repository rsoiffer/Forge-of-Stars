---
---

var store = [
  {% for page in site.pages %}
    {% if page.layout == "single" %}
      {% capture output %}
        {% render %}
          {{ page.content }}
        {% endrender %}
      {% endcapture %}

      {
        "title": {{ page.title | jsonify }},
        "excerpt": {{ output |
                      newline_to_br |
                      replace: "<br />", " " |
                      replace: "</p>", " " |
                      replace: "</h1>", " " |
                      replace: "</h2>", " " |
                      replace: "</h3>", " " |
                      replace: "</h4>", " " |
                      replace: "</h5>", " " |
                      replace: "</h6>", " "|
                      strip_html |
                      strip_newlines |
                      strip |
                      jsonify }},
        "url": {{ page.url | absolute_url | jsonify }}
      }
      {% unless forloop.last %}
        ,
      {% endunless %}
    {% endif %}
  {% endfor %}
];