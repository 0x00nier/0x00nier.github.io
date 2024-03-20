---
layout: default
---

<script src="https://cdn.jsdelivr.net/npm/jquery"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.terminal/js/jquery.terminal.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jquery.terminal/css/jquery.terminal.min.css"/>
<script>
$('body > div > section').terminal({
    whoami: function(what) {
        this.echo("[[!gb;#35fc03;<BACKGROUND>]Hi, I am Raghav Verma, a.k.a 0x00nier.");
        this.echo("[[!gb;#35fc03;<BACKGROUND>]Type more to get more information. You can tabcomplete as usual.");
    },
    more: function(what) {
        this.echo("[[!gb;#35fc03;<BACKGROUND>]I am a Cybersecurity Student @ UMD focused on skilling up in Offensive Security as a discipline, Binary Exploitation and");
        this.echo("[[!gb;#35fc03;<BACKGROUND>]Offensive Security as a discipline, Binary Exploitation and Reverse Engineering as a technique, and finally, breaking things");
        this.echo("[[!gb;#35fc03;<BACKGROUND>]to understand them as a mindset.");
        this.echo("[[!gb;#35fc03;<BACKGROUND>]Type whatelse to get more information.");
    },
    whatelse: function(what) {
        this.echo("[[!gb;#35fc03;<BACKGROUND>]I have worked at various companies as an intern and currently hold the OSCP, eJPT, CAP, CNSP, CEH amongst others.");
        this.echo("[[!gb;#35fc03;<BACKGROUND>]For more deets on my experience, please click on 'XP' in the header.");
        this.echo("[[!gb;#35fc03;<BACKGROUND>]Type theresmorelol to get more information (Yes there is more information sorry).");
    },
    theresmorelol: function(what) {
        this.echo("[[!gb;#35fc03;<BACKGROUND>]I also create writeups on stuff I find interesting. You know where to look at ;)");
    }
}, {
    completion: true,
    checkArity: false,
    greetings: 'Type whoami'
});
</script>

