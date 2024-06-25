---
title: "Unsubscribe From the Newsletter"
layout: plain
hidden: true
bodyclass: newsletter-form
---
You can unsubscribe from our newsletter via this form:

<section class="newsletter">
  <form action="https://newsletter.christiantietze.de/unsubscribe" method="POST" accept-charset="utf-8" validate>
    <input type="hidden" name="list" value="vGdm8DaHEoRuG7zMEPyC3w"/>
    <input type="hidden" name="subform" value="yes"/>
    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="hp" id="hp" tabindex="-1" value=""/></div>
    <section class="news__section">
      <label class="news__label" for="email">Email Address <span class="asterisk">*</span></label>
      <input type="email" value="" name="email" class="news__input news__input--text news__input--email" required id="email">
    </section>
    <section class="news__section news__section--indicates-required indicates-required"><span class="asterisk">*</span> indicates required</section>
    <!-- Unsubscribing doesn't need a reCAPTCHA-->
    <button type="submit" name="submit" id="submit" class="news__input news__input--button">Unsubscribe</button>
  </form>
</section>
