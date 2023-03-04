# Outlook HTML Signature Injector (MacOS)

Copy-and-paste your custom signature HTML into the application when prompted to add a new HTML MacOS Outlook signature.

- Allows pasting your own HTML markup and generating an Outlook signature with it.
- With the right HTML/CSS, this can allow for:
  - Using `<img>` tags inside `<table><tr><td>` cells, both with a set `height` and `width`, preventing image scaling and ***images being sent as attachments***.
  - Preventing phone numbers and addresses from auto-hyperlinking (by putting zero-width joiner `&zwnj` characters between visible characters in the phone numbers and addresses).
  - Safely creating interesting and complex signature designs.
