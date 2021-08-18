/**
 * @class Donut
 */
class Donut {

    /*
    Constructor
     */
    constructor(_data, _target) {
        // Assign parameters as object fields
        this.data = _data;
        this.target = _target;

        // Elements
        this.svg = null;
        this.g = null;

        // Configs
        this.svgW = 360;
        this.svgH = 360;
        this.gMargin = {top: 50, right: 0, bottom: 0, left: 0};
        this.gW = this.svgW - (this.gMargin.right + this.gMargin.left);
        this.gH = this.svgH - (this.gMargin.top + this.gMargin.bottom);
        this.lang_freqs = {};
        this.pie = null;
        this.color = d3.scaleOrdinal(d3.schemeAccent);
        this.pie_data = null;

        // Now init
        this.init();
    }

    /** @function init()
     * Perform one-time setup function
     *
     * @returns void
     */
    init() {
        // Define this vis
        const vis = this;

        // Set up the svg/g work space
        vis.svg = d3.select(`#${vis.target}`)
            .append('svg')
            .attr('width', vis.svgW)
            .attr('height', vis.svgH);
        vis.g = vis.svg.append('g')
            .attr('class', 'container')
            .style('transform', `translate(${vis.gMargin.left}px, ${vis.gMargin.top}px)`);

        // Now wrangle
        vis.wrangle();
    }

    /** @function wrangle()
     * Preps data for vis
     *
     * @returns void
     */
    wrangle() {
        // Define this vis
        const vis = this;
        vis.data.forEach(e => {
            vis.lang_freqs[e.language] = (vis.lang_freqs[e.language] || 0) + 1;
        });

        vis.pie = d3.pie()
            .value(d => d.value);

        vis.pie_data = vis.pie(d3.entries(vis.lang_freqs));


        // Now render
        vis.render();
    }

    /** @function wrangle()
     * Builds, updates, removes elements in vis
     *
     * @returns void
     */
    render() {
        // Define this vis
        const vis = this;
        vis.g.append("text")
            .attr("x", vis.gW / 2)
            .attr("y", -vis.gMargin.top / 3)
            .attr("text-anchor", "middle")
            .style("font-size", "24px")
            .text("Programming Languages");

        var langDesc = vis.g.append("text")
            .attr("x", vis.gW / 2)
            .attr("y", vis.gH / 2 - 20)
            .attr("text-anchor", "middle")
            .style("font-size", "20px")
            .text('');

        var dataDesc = vis.g.append("text")
            .attr("x", vis.gW / 2)
            .attr("y", vis.gH / 2 + 20)
            .attr("text-anchor", "middle")
            .style("font-size", "20px")
            .text('');

        const showMe = vis.g.selectAll('.donutG')
            .data(vis.pie_data)
            .enter()
            .append('path')
            .style('transform', `translate(${vis.gW / 2}px, ${vis.gH / 2}px`)
            .attr('d', d3.arc()
                .innerRadius(100)
                .outerRadius(150)
            )
            .attr('lang', d => d.data.key)
            .attr('fill', d => vis.color(d.data.key))
            .attr("stroke", "black")
            .style("stroke-width", "2px")
            .style("opacity", 0.7)
            .on('mouseover', function (d, i) {
                const lang = this.getAttribute('lang');
                langDesc.text(lang);
                dataDesc.text(vis.lang_freqs[lang]);
            })
            .on('mouseout', function (d, i) {
                langDesc.text('');
                dataDesc.text('');
            });
    }
}