---
layout: default
title: xp
---

<style>
/* Section Navigation */
.xp-nav {
  display: flex;
  gap: 4px;
  margin-bottom: 24px;
  border-bottom: 1px solid rgba(181, 232, 83, 0.2);
  padding-bottom: 0;
}

.xp-nav-btn {
  font-family: Monaco, monospace;
  font-size: 14px;
  color: #888;
  background: transparent;
  border: none;
  padding: 12px 20px;
  cursor: pointer;
  transition: all 0.2s ease;
  border-bottom: 2px solid transparent;
  margin-bottom: -1px;
}

.xp-nav-btn:hover {
  color: #b5e853;
}

.xp-nav-btn.active {
  color: #b5e853;
  border-bottom-color: #b5e853;
}

/* Sections */
.xp-section {
  display: none;
}

.xp-section.active {
  display: block;
}

/* CTF Cards */
.ctf-grid {
  display: grid;
  gap: 12px;
}

.ctf-card {
  display: flex;
  align-items: flex-start;
  padding: 16px;
  background: rgba(181, 232, 83, 0.03);
  border: 1px solid rgba(181, 232, 83, 0.1);
  border-radius: 6px;
  transition: all 0.2s ease;
}

.ctf-card:hover {
  border-color: rgba(181, 232, 83, 0.25);
  background: rgba(181, 232, 83, 0.05);
}

.ctf-rank {
  font-family: Monaco, monospace;
  font-size: 24px;
  font-weight: bold;
  color: #b5e853;
  min-width: 60px;
  text-align: center;
  margin-right: 16px;
  line-height: 1;
}

.ctf-rank small {
  display: block;
  font-size: 10px;
  color: #666;
  font-weight: normal;
  margin-top: 4px;
}

.ctf-info {
  flex: 1;
}

.ctf-name {
  font-family: Monaco, monospace;
  font-size: 15px;
  color: #eaeaea;
  margin: 0 0 6px 0;
}

.ctf-details {
  font-size: 13px;
  color: #888;
  margin: 0;
  line-height: 1.5;
}

.ctf-year {
  font-size: 12px;
  color: #555;
  background: rgba(0,0,0,0.3);
  padding: 2px 8px;
  border-radius: 3px;
  margin-left: auto;
  align-self: flex-start;
}

/* Certifications Grid */
.cert-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  gap: 20px;
  padding: 10px 0;
}

.cert-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.cert-item img {
  width: 100px;
  height: 100px;
  object-fit: contain;
  margin: 0;
  background: rgba(255,255,255,0.05);
  border-radius: 8px;
  padding: 8px;
  transition: transform 0.2s ease;
}

.cert-item img:hover {
  transform: scale(1.05);
}

.cert-label {
  font-family: Monaco, monospace;
  font-size: 11px;
  color: #666;
  margin-top: 8px;
}

/* Experience Timeline */
.timeline {
  position: relative;
  padding-left: 24px;
}

.timeline::before {
  content: '';
  position: absolute;
  left: 6px;
  top: 8px;
  bottom: 8px;
  width: 2px;
  background: rgba(181, 232, 83, 0.2);
}

.timeline-item {
  position: relative;
  padding-bottom: 32px;
}

.timeline-item:last-child {
  padding-bottom: 0;
}

/* Circle removed per user request */

.timeline-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 12px;
  gap: 16px;
}

.timeline-title-row {
  display: flex;
  align-items: baseline;
  gap: 10px;
  flex-wrap: wrap;
}

.timeline-role {
  font-family: Monaco, monospace;
  font-size: 16px;
  color: #b5e853;
  margin: 0;
}

.timeline-company {
  font-size: 14px;
  color: #888;
  font-family: Monaco, monospace;
}

.timeline-company::before {
  content: "@ ";
  color: #555;
}

.timeline-date {
  font-family: Monaco, monospace;
  font-size: 12px;
  color: #666;
  white-space: nowrap;
  text-align: right;
}

.timeline-list {
  margin: 0;
  padding-left: 1.5em;
  list-style: none !important;
}

.timeline-list li {
  font-size: 14px;
  color: #aaa;
  margin-bottom: 6px;
  line-height: 1.5;
  position: relative;
  list-style: none !important;
  list-style-image: none !important;
}

.timeline-list li::before {
  content: "—";
  color: #b5e853;
  position: absolute;
  left: -1.5em;
  opacity: 0.5;
}

.timeline-list li:last-child {
  margin-bottom: 0;
}

/* Responsive */
@media (max-width: 768px) {
  .xp-nav {
    flex-wrap: wrap;
  }

  .xp-nav-btn {
    padding: 10px 14px;
    font-size: 13px;
  }

  .ctf-card {
    flex-direction: column;
  }

  .ctf-rank {
    margin-right: 0;
    margin-bottom: 10px;
  }

  .ctf-year {
    margin-left: 0;
    margin-top: 10px;
  }

  .cert-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
</style>

<nav class="xp-nav">
  <button class="xp-nav-btn active" data-section="experience">Experience</button>
  <button class="xp-nav-btn" data-section="ctfs">CTFs</button>
  <button class="xp-nav-btn" data-section="certs">Certifications</button>
</nav>

<section class="xp-section active" id="experience">
  <div class="timeline">
    <div class="timeline-item">
      <div class="timeline-header">
        <div class="timeline-title-row">
          <h3 class="timeline-role">Security Engineer II - Red Team</h3>
          <span class="timeline-company">Google</span>
        </div>
        <span class="timeline-date">July 2024 - Present</span>
      </div>
      <ul class="timeline-list">
        <li>Working on a cool project</li>
        <li>Worked on a cool exercise</li>
        <li>Working on cool exercises</li>
        <li>Did some dev work</li>
        <li>Shadowed two cool exercises. Will shadow some more.</li>
      </ul>
    </div>

    <div class="timeline-item">
      <div class="timeline-header">
        <div class="timeline-title-row">
          <h3 class="timeline-role">Security Engineering Intern</h3>
          <span class="timeline-company">Google</span>
        </div>
        <span class="timeline-date">May 2023 - Aug 2023</span>
      </div>
      <ul class="timeline-list">
        <li>Evaluated the effectiveness of various tools detecting security vulnerabilities within Chrome Extensions and designed a methodology to identify them at scale.</li>
        <li>Conducted comprehensive audits of thousands of internal Chrome Extensions using tools such as CodeQL, Tarnish, and DoubleX to identify potential security vulnerabilities.</li>
        <li>Created a Pull Request to enhance Tarnish's capabilities, enabling it to parse Manifest Version 3, operate on localhost, and expand its permissions identification functionality.</li>
        <li>Developed efficient helper scripts to optimize the process of manually auditing Chrome Extensions for vulnerabilities.</li>
        <li>Identified a critical exploitable bug within an internal Chrome Extension used by 20k+ Googlers and presented findings to diverse security teams.</li>
      </ul>
    </div>

    <div class="timeline-item">
      <div class="timeline-header">
        <div class="timeline-title-row">
          <h3 class="timeline-role">ML Engineer Intern</h3>
          <span class="timeline-company">Jupiter AI Labs</span>
        </div>
        <span class="timeline-date">Nov 2021 - May 2022</span>
      </div>
      <ul class="timeline-list">
        <li>Successfully implemented a data pipeline and API interface for the Taxonomy Recommendation and Classification Engine, utilizing APA's Azure SQL database.</li>
        <li>Developed a Ticket Priority Scheduler that utilizes a blend of classification and regression algorithms to accurately prioritize tickets with a fresh data accuracy rate of 94%.</li>
        <li>Conducted a comprehensive analysis of MMYT and EMT stocks, incorporating historical data from Yahoo Finance and existing quarterly financial statements to predict future stock values.</li>
        <li>Utilized the Sobel Edge and Harris Corner Detection techniques, in conjunction with a Gaussian mixture model, to match appliance images and group their edges and corners.</li>
      </ul>
    </div>

    <div class="timeline-item">
      <div class="timeline-header">
        <div class="timeline-title-row">
          <h3 class="timeline-role">Cybersecurity Research Intern</h3>
          <span class="timeline-company">COSGrid Networks</span>
        </div>
        <span class="timeline-date">Jan 2021 - Aug 2021</span>
      </div>
      <ul class="timeline-list">
        <li>Led a team that created an IoT Device Classification and Anomaly Detection prototype, using tools such as Spark, XGBoost, Sklearn, Zeek, Argus, and TShark, achieving 91% accuracy on fresh data. The prototype was selected as a finalist in the 'Cyber Security Grand Challenge!' organized by DSCI.</li>
        <li>Successfully deployed Apache Metron as a Big Data Network Intrusion Detection Solution on an AWS IoT Greengrass testbed, achieving an accuracy of 92.4% and a false positive rate of 0.24% in detecting malicious attacks automated by Guardicore's Infection Monkey.</li>
      </ul>
    </div>

    <div class="timeline-item">
      <div class="timeline-header">
        <div class="timeline-title-row">
          <h3 class="timeline-role">Data Security Intern</h3>
          <span class="timeline-company">Neubrain</span>
        </div>
        <span class="timeline-date">Apr 2021 - Jul 2021</span>
      </div>
      <ul class="timeline-list">
        <li>Conducted a Penetration Test on Neubrain's web server hosting WordPress websites and identified 4+ vulnerabilities including the use of unsafe WordPress plugins, weak passwords, and insecure PHP code.</li>
        <li>Upon immediate employment, performed Incident Response on defacement of the web server and reported the method of infiltration and exfiltration.</li>
        <li>Successfully hardened the WordPress server post-defacement and prevented attacks by setting up Web Application Firewalls, upgrading PHP and implementing other hardening mechanisms.</li>
      </ul>
    </div>

    <div class="timeline-item">
      <div class="timeline-header">
        <div class="timeline-title-row">
          <h3 class="timeline-role">Ethical Hacking Student Intern</h3>
          <span class="timeline-company">Cryptus Cyber Security</span>
        </div>
        <span class="timeline-date">May 2020 - Oct 2020</span>
      </div>
      <ul class="timeline-list">
        <li>Generated Penetration Testing Reports on 2 vulnerable client sites and reported several highly critical vulnerabilities such as SQL Injection and Remote Command Execution (RCE).</li>
        <li>Researched fileless malware, documenting Office macro attacks and in-memory injection of payloads using PowerShell and gained insight into Active Directory engagements.</li>
        <li>Conducted research on the internal workings of tools such as TheFatRat and Veil Framework and acquired a deeper understanding of encryption mechanisms such as XOR/AES Encryption and basic code obfuscation techniques.</li>
      </ul>
    </div>
  </div>
</section>

<section class="xp-section" id="ctfs">
  <div class="ctf-grid">
    <div class="ctf-card">
      <div class="ctf-rank">#1<small>quals</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">CSAW 2023</h4>
        <p class="ctf-details">Team "UMDCSEC" earned 1st place in the qualifiers</p>
      </div>
      <span class="ctf-year">2023</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#39<small>/1287</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">Fetch the Flag CTF</h4>
        <p class="ctf-details">As a member of Space.Cows</p>
      </div>
      <span class="ctf-year">2023</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#39<small>solo</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">IrisCTF</h4>
        <p class="ctf-details">Solved 8 challenges in Rev, PWN, Networks, Misc</p>
      </div>
      <span class="ctf-year">2023</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#69<small>/400</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">Pragyan CTF</h4>
        <p class="ctf-details">Solved reversing and forensics challenges</p>
      </div>
      <span class="ctf-year">2023</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#106<small>/580</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">National Cyber League Fall</h4>
        <p class="ctf-details">Individual Game, Experienced Students Bracket. Team Game: #63/457</p>
      </div>
      <span class="ctf-year">2023</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#186<small>/980</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">LA CTF</h4>
        <p class="ctf-details">Solved 9 challenges in Reversing, Misc, Web</p>
      </div>
      <span class="ctf-year">2023</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#502<small>27 solves</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">HackTheBox Cyber Apocalypse CTF</h4>
        <p class="ctf-details">Team Captain of 0d4yR007 (2 members). Pwn, Forensics, Rev, Hardware, Crypto, ML</p>
      </div>
      <span class="ctf-year">2023</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#397<small>/6675</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">National Cyber League Fall</h4>
        <p class="ctf-details">Individual Game</p>
      </div>
      <span class="ctf-year">2022</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#544<small>solo</small></div>
      <div class="ctf-info">
        <h4 class="ctf-name">DownUnderCTF</h4>
        <p class="ctf-details">Solo competitor (nier0x00) in team "UMDCSEC-B"</p>
      </div>
      <span class="ctf-year">2022</span>
    </div>

    <div class="ctf-card">
      <div class="ctf-rank">#2475</div>
      <div class="ctf-info">
        <h4 class="ctf-name">Flare-On CTF</h4>
        <p class="ctf-details">Annual reverse engineering CTF by Mandiant</p>
      </div>
      <span class="ctf-year">2022</span>
    </div>
  </div>
</section>

<section class="xp-section" id="certs">
  <div class="cert-grid">
    <div class="cert-item">
      <img src="https://api.accredible.com/v1/frontend/credential_website_embed_image/badge/64442278" alt="OSCP">
      <span class="cert-label">OSCP</span>
    </div>
    <div class="cert-item">
      <img src="https://api.accredible.com/v1/frontend/credential_website_embed_image/badge/81524262" alt="eJPT">
      <span class="cert-label">eJPT</span>
    </div>
    <div class="cert-item">
      <img src="./imgs/ceh.png" alt="CEH">
      <span class="cert-label">CEH</span>
    </div>
    <div class="cert-item">
      <img src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*Rpuuol3RK6Tdyv4DN10UWw.png" alt="CAP" style="background-color:white">
      <span class="cert-label">CAP</span>
    </div>
    <div class="cert-item">
      <img src="https://secops.group/wp-content/uploads/2023/02/Certified-Network-Security-Practitioner-whbg.png" alt="CNSP" style="background-color:white">
      <span class="cert-label">CNSP</span>
    </div>
    <div class="cert-item">
      <img src="https://images.credly.com/size/340x340/images/00634f82-b07f-4bbd-a6bb-53de397fc3a6/image.png" alt="Security+">
      <span class="cert-label">Security+</span>
    </div>
  </div>
</section>

<script>
document.querySelectorAll('.xp-nav-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    // Update active button
    document.querySelectorAll('.xp-nav-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');

    // Show corresponding section
    const sectionId = btn.dataset.section;
    document.querySelectorAll('.xp-section').forEach(s => s.classList.remove('active'));
    document.getElementById(sectionId).classList.add('active');
  });
});
</script>
