---
layout: home
---

{% assign progs = site.programs | sort: "order" %}
<ul>
{% for program in progs  %}
  <li>
    <a href="{{ site.baseurl }}{{ program.url }}">{{ program.name }}</a>
    <p>{{ program.goal }}</p>
  </li>
{% endfor %}
</ul>
