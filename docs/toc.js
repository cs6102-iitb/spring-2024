// Populate the sidebar
//
// This is a script, and not included directly in the page, to control the total size of the book.
// The TOC contains an entry for each page, so if each page includes a copy of the TOC,
// the total size of the page becomes O(n**2).
class MDBookSidebarScrollbox extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = '<ol class="chapter"><li class="chapter-item "><a href="welcome.html">Welcome</a></li><li class="chapter-item affix "><li class="spacer"></li><li class="chapter-item "><a href="installation.html">Installation</a></li><li class="chapter-item affix "><li class="spacer"></li><li class="chapter-item "><a href="assignments/deadlines.html">Assignments</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="assignments/assignment1.html">Assignment 1</a></li><li class="chapter-item "><a href="assignments/assignment2.html">Assignment 2</a></li><li class="chapter-item "><a href="assignments/assignment3.html">Assignment 3</a></li></ol></li><li class="chapter-item "><li class="spacer"></li><li class="chapter-item "><a href="resources.html">Resources</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="verilog_resources/about.html">Verilog</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="verilog_resources/data_types.html">Data Types</a></li><li class="chapter-item "><a href="verilog_resources/building_blocks.html">Building Blocks</a></li><li class="chapter-item "><a href="verilog_resources/blocking_nonblocking.html">Blocking vs Non-blocking</a></li><li class="chapter-item "><a href="verilog_resources/conditional_statement.html">Conditional Statements</a></li><li class="chapter-item "><a href="verilog_resources/param_localparam.html">Parameters</a></li></ol></li><li class="chapter-item "><a href="digital_circuits/about.html">Digital Circuits</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="digital_circuits/ripple_carry_adder.html">Ripple Carry Adder</a></li><li class="chapter-item "><a href="digital_circuits/up_down_counter.html">Up Down Counter</a></li><li class="chapter-item "><a href="digital_circuits/alu.html">ALU</a></li><li class="chapter-item "><a href="digital_circuits/karatsuba_multiplier.html">Karatsuba Multiplier</a></li><li class="chapter-item "><a href="digital_circuits/fifo.html">FIFO</a></li></ol></li></ol></li><li class="chapter-item "><li class="spacer"></li><li class="chapter-item "><a href="changelog.html">Changelog</a></li></ol>';
        // Set the current, active page, and reveal it if it's hidden
        let current_page = document.location.href.toString().split("#")[0];
        if (current_page.endsWith("/")) {
            current_page += "index.html";
        }
        var links = Array.prototype.slice.call(this.querySelectorAll("a"));
        var l = links.length;
        for (var i = 0; i < l; ++i) {
            var link = links[i];
            var href = link.getAttribute("href");
            if (href && !href.startsWith("#") && !/^(?:[a-z+]+:)?\/\//.test(href)) {
                link.href = path_to_root + href;
            }
            // The "index" page is supposed to alias the first chapter in the book.
            if (link.href === current_page || (i === 0 && path_to_root === "" && current_page.endsWith("/index.html"))) {
                link.classList.add("active");
                var parent = link.parentElement;
                if (parent && parent.classList.contains("chapter-item")) {
                    parent.classList.add("expanded");
                }
                while (parent) {
                    if (parent.tagName === "LI" && parent.previousElementSibling) {
                        if (parent.previousElementSibling.classList.contains("chapter-item")) {
                            parent.previousElementSibling.classList.add("expanded");
                        }
                    }
                    parent = parent.parentElement;
                }
            }
        }
        // Track and set sidebar scroll position
        this.addEventListener('click', function(e) {
            if (e.target.tagName === 'A') {
                sessionStorage.setItem('sidebar-scroll', this.scrollTop);
            }
        }, { passive: true });
        var sidebarScrollTop = sessionStorage.getItem('sidebar-scroll');
        sessionStorage.removeItem('sidebar-scroll');
        if (sidebarScrollTop) {
            // preserve sidebar scroll position when navigating via links within sidebar
            this.scrollTop = sidebarScrollTop;
        } else {
            // scroll sidebar to current active section when navigating via "next/previous chapter" buttons
            var activeSection = document.querySelector('#sidebar .active');
            if (activeSection) {
                activeSection.scrollIntoView({ block: 'center' });
            }
        }
        // Toggle buttons
        var sidebarAnchorToggles = document.querySelectorAll('#sidebar a.toggle');
        function toggleSection(ev) {
            ev.currentTarget.parentElement.classList.toggle('expanded');
        }
        Array.from(sidebarAnchorToggles).forEach(function (el) {
            el.addEventListener('click', toggleSection);
        });
    }
}
window.customElements.define("mdbook-sidebar-scrollbox", MDBookSidebarScrollbox);
