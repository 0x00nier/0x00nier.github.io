---
layout: default
---
## About Me

I discovered my passion for cybersecurity and ethical hacking while watching the show Mr. Robot, which sparked my curiosity to experiment with tools like Metasploit, Bettercap, BurpSuite, Nikto, and the Airo-ng suite on Kali Linux. This initial foray into hacking led to further exploration and learning, including internships at Google, Neubrain, COSGrid Networks, and Cryptus Cyber Security, as well as projects that combined machine learning and defensive security during my undergraduate studies at Bennett University.

I have received both the Offensive Security Certified Practitioner (OSCP) and Certified Ethical Hacker (CEH) certifications, and have further developed my skills through hands-on practice on platforms like HackTheBox, TryHackMe, and Proving Grounds, as well as by participating in competitive CTFs. My expertise includes troubleshooting issues that arise during penetration tests, as well as experience in system administration and general operations. I am proficient in Bash and Python, and have a particular affinity for using regular expressions to filter output. In addition to my technical skills, I have experience proofreading academic research across various fields, including computer science, philosophy, and psychology.

Currently, I am focused on Offensive Security and strive to stay current with security research and practice Penetration Testing/Red Teaming. Additionally, I am looking to upskill myself in Web Security to increase my probability of getting footholds and in Heap/Kernel Exploitation (P.S I love pwntools).

I am also interested in Digital Forensics and Incident Response, and have begun learning about Reverse Engineering and Malware Analysis using resources such as TCM Security's course and utilising FLARE's VM. I have also been using Cheat Engine for basic game pwning on HTB, dnSpy/ilSpy for .NET debugging and decompiling, JD-GUI and ApkTool for Java-related Reverse Engineering and Ghidra/Binary Ninja for general RE.

All this ties into my desire to get better at Vulnerability Research (VR). I often create write-ups for the CTF challenges/machines I work on and welcome you to check them out.

&nbsp;
&nbsp;

## Projects

### Optimizing Symbolic Execution for Malware Analysis and CTF Challenges Using Deep Learning-based Constraint Prediction

This [research project](https://docs.google.com/presentation/d/1hes7wrrfc-wy-o6_7JQ1Z-a8D37h27_9/edit#slide=id.p1) aims to develop a model that can identify key characteristics of the binary code, such as the presence of nested conditionals/specific encryption algorithms via encrypted-decrypted string pairs and generate constraints that significantly reduce the search space of the symbolic execution engine.

### Penetration Test on a Vulnerable VM

Conducted a Penetration Test on a vulnerable VM provided to us in the course “Security Tools for Information Security” and reported multiple vulnerabilities such as RCE via Arbitrary File Upload, Insecure Credentials, and much more leading to the leak of 6 hidden flags.

### Forensic Investigation on Log Files

- Leveraged Splunk on Linux-based log files provided to us in the course “Security Tools for Information Security” to understand the events surrounding an attack that utilized a heavily obfuscated PHP C2 gaining Command Execution to change passwords and exfiltrate a sensitive database.
- Generated a report on the attacker’s TTPs and gave recommendations for mitigating the potential security issues present in the various web endpoints.

### Malware Detection Using Machine Learning

Developed a Python-based prototype for Malware Detection by employing a disassembled instruction tokenization approach, which utilizes mnemonic n-grams extracted from Vex-IRs and Approximate Agglomerative Clustering to group samples into two distinct categories: malware and non-malware.

### Forensic Investigation on a Raw Memory Image

Utilized Autopsy to scan the raw memory image provided to us in the course "Digital Forensics and Incident Response" to extract hidden artifacts and various bots masquerading as VeraCrypt-encrypted malware.

### Parallelizing Ciphers

In the current software development industry, ciphers keep on growing in temporal and spatial size in terms of implementations due to the constant paranoia of breaking the security of these ciphers. Our approaches to creating ciphers have moreso taken the form of being more complex and bigger in size than ever and therefore the need for efficiency of these ciphers is of the hour. It is important to keep both efficiency and durability of ciphers while creating them completely anew. Therefore, in this [comparative study](https://github.com/0x00nier/CipherSurvey), we shall examine various approaches to parallelizing ciphers in the languages of C++, a nearly bare-metal language, and Python as a contrasting versatile language to understand and conclude a series of best practices on parallelizing cipher encryption/decryption to apply in general cryptographic implementations. We shall implement various libraries such as OpenMP (a representative for a threading-based implementation) and Joblibs (a representative for a multiprocessing-based implementation) over various kinds of ciphers in an attempt to generalize a series of best practices in parallelization. Our scope of generalization will not be absolute and will merely serve as a set of guiding principles while creating ciphers in the future for the sake of durable security. The contribution will be in terms of the evaluated best practices while attempting to parallelise ciphers using multiple techniques, which would help establish a baseline standard for faster ciphers in general.

### Network Intrusion Detection System Using The UNSW-NB15 Dataset

A reasonably good Network Intrusion Detection System generally requires a high detection rate and a low false alarm rate in order to predict anomalies more accurately. Older datasets are unable to capture the schema of a set of modern attacks and therefore modelling based on these datasets lacked sufficient generalizability. In [this paper](https://github.com/0x00nier/NIDS-Using-UNSW-NB15), we operate on the UNSW-NB15 dataset that is currently one of the best representatives of modern attacks and thereby suggest various kinds of models. We discuss various models and conclude our discussion with the model that performs the best using various kinds of evaluation metrics. Alongside modelling, a comprehensive data analysis on the features of the dataset itself using our understanding of correlation, variance and similar such factors for a wider picture is done for better modelling. Furthermore, hypothetical ponderings are discussed for potential Network Intrusion Detection Systems including suggestions on prospective modelling and dataset generation as well.

### Instantaneous Mitigation and Prevention of ARP Spoofing

In [this paper](https://docs.google.com/document/d/1VB9wDyWqtlOSxPpvgNw_JbzjoPkSGRJoFnQwbywowuA/edit?usp=sharing), we propose two methodologies to instantaneously mitigate the problem of ARP Spoofing Attacks on a Linux/Unix based operating system from single or multiple host operating system(s). Our first methodology aims to revise the table containing malicious entries to the original valid table after detecting an ARP Spoofing Attack. Our mechanism to demonstrate this practically involves Shell Scripting, with a Python script as a background process, which can run indefinitely if the defender chooses so. Our second methodology is a conjectural approach involving databases redirecting unauthenticated changes to a duplicate table that acts as the system's ARP cache table and thereby, simultaneously checking for malicious changes and flagging the attacker's MAC Address, as a potential attacker in another table. The actual system's ARP cache table reflects the entries in the database's table, if and only if the table doesn't have duplicate entries within it. The experimental demonstration of the former methodology has been featured with favorable changes as compared to previous solutions to this problem.

### Smart IoT Dustbin

[This project](https://github.com/0x00nier/EnevoSmartIOTDustbin) incorporates NodeMCU, a WiFi Micro-controller, a Dustbin, an Ultrasonic Sensor and basic wiring. This project aims to do is provide a prototype for a slightly smart dustbin which calculates the percentage of dustbin filled up. As soon as a set threshold is crossed, a notification is pinged to the required person and if said person clicks on a certain button on the app, it will show the path towards the dustbin from their current location for efficient clearing of garbage

This can easily be expanded onto a larger scale however, most of the equipment would be changing and we would need to apply machine learning in order to make schedules for various cleaners employed in this system of garbage management.

### Steganography

[This project](https://github.com/0x00nier/Steganography-Project) is an interactive Python-based GUI for a steganographic function (encoding/decoding text in/from an image)

&nbsp;
&nbsp;

## Blogs

- [Pragyan CTF 2023 — The Kingpin Write-up](./blogs/pragyan/kingpin.html)
- [Spooky License — Reversing Challenge — HackTheBox Writeup](./blogs/htb/spookylicense/spookylicense.html)
- [Bombs Landed — Reversing Challenge — HackTheBox Write-up](./blogs/htb/bombslanded/bombslanded.html)
- [BroScience (Medium)— HackTheBox Write-up](./blogs/htb/broscience/broscience.html)
- [IrisCTF 2023 — Name that song && Name that song 2 Write-up](./blogs/irisctf/namethatsong/namethatsong.html)
- IrisCTF 2023 — ret2libm Write-up
- [IrisCTF 2023 — babyseek Write-up](./blogs/irisctf/babyseek/babyseek.html)
- [re3 Challenge Write-Up [CCT2019]](./blogs/re3/re3.html)
- PersistenceisFutile — Forensic Challenge — HackTheBox Write-up
