// ==UserScript==
// for more updated scripts, see: https://greasyfork.org/en/scripts/by-site/youtube.com
// @name         Auto Skip YouTube Ads
// @version      1.1.0
// @description  Speed up and skip YouTube ads automatically
// @author       jso8910 and others
// @match        *://*.youtube.com/*
// ==/UserScript==


setInterval(() => {
    const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button,.ytp-skip-ad-button,.ytp-ad-skip-button-modern');
    if (btn) {
        btn.click();
    }
    const ad = document.querySelector('.ad-showing video');
    if (ad) {
        ad.currentTime = ad.duration || 999999;
    }
}, 500);
