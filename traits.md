---
layout: single
title: Traits
sidebar:
  nav: system
---

{% for trait in site.data.traits %}
### {% trait {{ trait[0] }} %}
<!-- ### {{ trait[0] }} -->
{{ trait[1] | process }}
{% endfor %}