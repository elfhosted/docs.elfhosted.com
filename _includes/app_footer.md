
{% if page.meta.works_with %}
## {{ page.meta.slug }} also works with
{% for app in page.meta.works_with %}
* [x] [{{ app }}][{{ app | lower }}]
{% endfor %}
{% endif %}

## How do I get support for {{ page.meta.slug }}?

1. For general use of {{ page.meta.slug }}, refer to the [official site]({{ page.meta.upstream }}) or to one of the links [below](#useful-links).
2. For specific support re your ElfHosted configuration / account, see the [ElfHosted support options](/get-help/)!

{% if page.meta.sponsorship %}
## Sponsor {{ page.meta.slug }} ❤️

You can contribute directly to the development of {{ page.meta.slug }} using the following:
{% for link in page.meta.sponsorship %}
* [{{ link.name }}]({{ link.uri }})
{% endfor %}
{% endif %}

## {{ page.meta.slug }} resources

* [{{ page.meta.slug }} (official site)]({{ page.meta.upstream }})
{% if page.meta.links %}
{% for link in page.meta.links %}
* [{{ page.meta.slug }} {{ link.name }}]({{ link.uri }})
{% endfor %}
{% endif %}

!!! warning "Bring your own content"

    ElfHosted deploys {{ page.meta.slug }} as infrastructure only. We do not supply media, indexes, or accounts, and we cannot vet how you configure the app. You must provide your own lawful sources, ensure you have the rights to access anything you connect, and comply with our [Acceptable Use Policy](/legal/acceptable-use/) and [No-Piracy Policy](/legal/no-piracy-policy/). Abuse complaints are handled per the [Abuse Policy](/legal/abuse/) and [Notice & Takedown process](/legal/takedownnotice/); misconfigured workloads may be suspended without refund.

{% include 'testimonials.md' %}

--8<-- "common-links.md"