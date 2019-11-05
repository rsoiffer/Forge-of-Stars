---
layout: single
title: Basic Powers
sidebar:
  nav: system
---

{% for action in site.data.basic-powers %}
  
## {{ action[0] }}
{{ action[1].type }}
{% for trait in action[1].traits %}[ {{ trait }} ]{% endfor %}
{% for tag in action[1].tags %}
  **{{ tag[0] | capitalize }}:** {{ tag[1] }}
{% endfor %}
---
{{ action[1].effect }}

{% if action[1].critical-success %}
  **Critical Success:** {{ action[1].critical-success }}
{% endif %}

{% if action[1].success %}
  **Success:** {{ action[1].success }}
{% endif %}

{% if action[1].failure %}
  **Failure:** {{ action[1].failure }}
{% endif %}

{% if action[1].critical-failure %}
  **Critical Failure:** {{ action[1].critical-failure }}
{% endif %}

{% endfor %}
