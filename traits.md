---
layout: single
title: Traits
sidebar:
  nav: system
---

{% for trait in site.data.traits %}
### {{ trait[0] }}
{{ trait[1] }}
{% endfor %}