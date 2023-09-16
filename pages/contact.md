---
title: Contact
---

<div class="content-body">

If you are interested in collaborating, you can reach me using the links below. I'm iterested in:

- Leadership, mentoring and management.
- Scaling cybersecurity or engineering teams.
- Technology or service product development.
- Technology, culture and security evaluations for M&A.
- Cybersecurity detection and evasion R&D.
- Teaching or substantiating cyber security concepts.


#### Contact Methods

<div class="contact">
<noscript>
<style>#mail-wrap{ display: none; }</style>
<div title="Email"><i class="fa fa-envelope"></i>&nbsp;michael&nbsp;[at]&nbsp;michaelshannon&nbsp;[dot]&nbsp;ca</div>
</noscript>
<div title="Email" id="mail-wrap"><a><i class="fa fa-envelope"></i>&nbsp;michael…</a>&nbsp;<button>Click to Reveal</button></div>
<div title="GitHub"><a href="https://github.com/michaelshannon-ca" target="_blank"><i class="fa fa-github"></i>&nbsp;michaelshannon-ca</a></div>
</div>

</div>

<script>
    var emNode = document.getElementById('mail-wrap');
    function revealEm() {
        var emComp1 = "michael";
        var emComp2 = "@";
        var emComp3 = "michaelshannon.ca";
        var em = emComp1 + emComp2 + emComp3;
        emNode.innerHTML = '<a href="mailto:' + em + '" target="_blank"><i class="fa fa-envelope"></i>&nbsp;' + em + '</a>'
        if(typeof ga == "function") {
            ga('send', 'event', 'contact_page', 'contact_info', 'show_email', null);
        }
    }
    emNode.addEventListener('click', function() { revealEm() });
</script>
