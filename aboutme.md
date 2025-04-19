---
layout: default
---

<script src="https://cdn.jsdelivr.net/npm/jquery"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.terminal/js/jquery.terminal.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jquery.terminal/css/jquery.terminal.min.css"/>
<style>
.terminal {
  --size: 1.3;
}
</style>
<script>
$('body > div > section').terminal({
    whoami: function(what) {
        this.echo("[[!g;#35fc03;<BACKGROUND>]Hi, I am 0x00nier.");
        this.echo("[[!g;#35fc03;<BACKGROUND>]Type more to get more information. You can tabcomplete as usual.");
    },
    more: function(what) {
        this.echo("[[!g;#35fc03;<BACKGROUND>]I am a Security Engineer @ Google focused on skilling up in Offensive Security as a discipline, Binary Exploitation as a skill and Reverse Engineering as a technique, and finally, breaking things to understand them as a mindset.");
        this.echo("[[!g;#35fc03;<BACKGROUND>]Type whatelse to get more information.");
    },
    whatelse: function(what) {
        this.echo("[[!g;#35fc03;<BACKGROUND>]I have worked at various companies as an intern and currently hold the OSCP, eJPT, CAP, CNSP, CEH and many others (that are as useless as CEH).");
        this.echo("[[!g;#35fc03;<BACKGROUND>]For more deets on my experience, please click on 'xp' in the header.");
        this.echo("[[!g;#35fc03;<BACKGROUND>]Type theresmorelol to get more information (Yes there is more information sorry).");
    },
    theresmorelol: function(what) {
        this.echo("[[!g;#35fc03;<BACKGROUND>]I also create writeups on stuff I find interesting. You know where to look at ;)");
        this.echo("[[!g;#35fc03;<BACKGROUND>]A puzzle awaits you in 'secret'");
    },
    secret: function(what) {
        this.echo("[[!g;#35fc03;<BACKGROUND>]717764707a65377852563663586b655a53695141437a53337448654a7955684155723539754e334d65546266773939424c6b4c6a645979335a45445438395337696837635974766d476b4e5a3965624a4c43453153476f364c7766436e5a506d746b");
    }
}, {
    completion: true,
    checkArity: false,
    greetings: 'Linux 0x00nier 6.6.9-amd64 #1 SMP PREEMPT_DYNAMIC Rokosreplicant 6.6.9-1nier1 (2024-01-08) x86_64 GNU/Linux \nType whoami'
});
</script>
