'use strict';

let members = [];
let languages = [];
let bars = null;
let donut = null;

d3.json('/load_data').then(d => {

    members = d.members;
    languages = d.languages;
    d3.select('#members').append('span').text(members.length);

    bars = new Bars(members, 'vis1');
    donut = new Donut(languages, 'vis2');

}).catch(err => console.log(err));