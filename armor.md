---
layout: single
title: Armor
sidebar:
  nav: equipment
---

## Light Armor

<table>
  <tr>
    <th>Name</th>
    <th>Cost</th>
    <th>AC Bonus</th>
    <th>HP Bonus</th>
    <th>Agility Cap</th>
    <th>Strength Req</th>
    <th>Weight</th>
    <th>Special</th>
  </tr>
  {% for armor in site.data.armor %}
    {% if armor[1].type == "Light" %}
      <tr>
        <td>{{ armor[0] }}</td>
        <td>{{ armor[1].cost }} cred</td>
        <td>+{{ armor[1].ac }}</td>
        <td>{{ armor[1].hp }}</td>
        <td>+{{ armor[1].max_agi }}</td>
        <td>{{ armor[1].req_str }}</td>
        <td>{{ armor[1].weight }} lb</td>
        <td>{{ armor[1].special | uniq | sort | join: ", " }}</td>
      </tr>
    {% endif %}
  {% endfor %}
</table>

## Heavy Armor

<table>
  <tr>
    <th>Name</th>
    <th>Cost</th>
    <th>AC Bonus</th>
    <th>HP Bonus</th>
    <th>Agility Cap</th>
    <th>Strength Req</th>
    <th>Weight</th>
    <th>Special</th>
  </tr>
  {% for armor in site.data.armor %}
    {% if armor[1].type == "Heavy" %}
      <tr>
        <td>{{ armor[0] }}</td>
        <td>{{ armor[1].cost }} cred</td>
        <td>+{{ armor[1].ac }}</td>
        <td>{{ armor[1].hp }}</td>
        <td>+{{ armor[1].max_agi }}</td>
        <td>{{ armor[1].req_str }}</td>
        <td>{{ armor[1].weight }} lb</td>
        <td>{{ armor[1].special | uniq | sort | join: ", " }}</td>
      </tr>
    {% endif %}
  {% endfor %}
</table>