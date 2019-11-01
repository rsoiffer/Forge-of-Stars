---
layout: single
title: Ancestries
sidebar:
  nav: system
---

Note that the stats below are incomplete. Eventually, all the races below will have multiple subraces.

{% for ancestry in site.data.ancestries %}
## {{ ancestry[0] }}
{{ ancestry[1].lore }}

### Effects:
{{ ancestry[1].effects }}
{% endfor %}
