---
status: wip
---
# Random stuff on MKDocs (+ Material)

## Automatic page status
Thanks to [Kai Anter's Digital Garden](https://wiki.anter.dev/docs/digital-gardening/#displaying-the-page-status-in-material-for-mkdocs) I was able to configure an easy way to apply a "label" to every page without becoming stupid in copy-pasting long piece of codes.

<div align=center> <b>BUT</b> </div>

There are some caviat:

- He forgot to mention that you also have to tell MKDocs that [you're actually overriding some files](https://squidfunk.github.io/mkdocs-material/customization/#extending-the-theme), so basically:

``` yaml
theme:
  name: material
  custom_dir: overrides
```

- No matter what, the text is static, meaning that you'll always get something like this:
!!! info 
    Page status

So, except for the obvious change, this is the changed code of the content.html page:

``` jinja2
{% include "partials/tags.html" %}
{% include "partials/actions.html" %}
{% if "\x3ch1" not in page.content %}
  <h1>{{ page.title | d(config.site_name, true)}}</h1>
{% endif %}

<!-- This is the snippet that displays the status -->
{% if page.meta and page.meta.status %}
  {% if config.extra.status %}
    {% if page.meta.status in config.extra.status %}
      <div class="admonition info">
        <p class="admonition-title">
          <span>Page Status: {{ config.extra.status[page.meta.status] }}</span>
          {% if config.extra.status_explanation %}
          <span>
            <a href="{{- config.extra.status_explanation.url | url -}}">{{- config.extra.status_explanation.text -}}</a>
          </span>
          {% endif %}
        </p>
      </div>
    {% endif %}
  {% endif %}
{% endif %}

{{ page.content }}

{% include "partials/source-file.html" %}
{% include "partials/feedback.html" %}
{% include "partials/comments.html" %}
```